using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Net.Mail;
using System.Text;
using System.Text.Json;
using MathWorldAPI.Models;

namespace MathWorldAPI.Services;

// Explicit OAuth send-only transport. No SMTP password, read scope, arbitrary
// endpoint, credential logging, or fallback to another provider.
internal static class GmailEmailTransport
{
    private static bool SafeMailbox(string? value) =>
        !string.IsNullOrWhiteSpace(value) && value.Length<=254 &&
        value.All(c=>c>32&&c<127) && MailAddress.TryCreate(value,out var a) &&
        string.Equals(a.Address,value,StringComparison.OrdinalIgnoreCase);
    private static string Base64Body(string value)=>Convert.ToBase64String(Encoding.UTF8.GetBytes(value),Base64FormattingOptions.InsertLineBreaks);
    private static string Mime(EmailOutboxItem item,TransactionalEmail mail,string from)
    {
        var boundary="mathworld_"+item.Id.ToString("N");
        // Fold encoded words at Unicode scalar boundaries, each <75 characters.
        var words=new List<string>();var part=new StringBuilder();int bytes=0;
        foreach(var rune in mail.Subject.EnumerateRunes())
        {
            if(bytes+rune.Utf8SequenceLength>42){words.Add("=?UTF-8?B?"+Convert.ToBase64String(Encoding.UTF8.GetBytes(part.ToString()))+"?=");part.Clear();bytes=0;}
            part.Append(rune.ToString());bytes+=rune.Utf8SequenceLength;
        }
        if(part.Length>0)words.Add("=?UTF-8?B?"+Convert.ToBase64String(Encoding.UTF8.GetBytes(part.ToString()))+"?=");
        var subject=string.Join("\r\n ",words);
        return "From: MathWorld <"+from+">\r\nTo: "+item.Recipient+
            "\r\nSubject: "+subject+"\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative; boundary=\""+boundary+"\"\r\n\r\n"+
            "--"+boundary+"\r\nContent-Type: text/plain; charset=UTF-8\r\nContent-Transfer-Encoding: base64\r\n\r\n"+Base64Body(mail.PlainText)+"\r\n"+
            "--"+boundary+"\r\nContent-Type: text/html; charset=UTF-8\r\nContent-Transfer-Encoding: base64\r\n\r\n"+Base64Body(mail.Html)+"\r\n--"+boundary+"--\r\n";
    }
    public static async Task<BrevoOutcome> SendAsync(IHttpClientFactory clients,Func<string,string?> read,EmailOutboxItem item,TransactionalEmail mail,CancellationToken ct)
    {
        var from=read("From");
        if(!SafeMailbox(from)||!SafeMailbox(item.Recipient))return new("Failed",ErrorCode:"InvalidMailbox");
        // Token exchange is not message transmission. A failure here cannot
        // be mistaken for an accepted email.
        string? accessToken;
        using var client=clients.CreateClient("GmailTransactional");
        try
        {
            using var tokenRequest=new HttpRequestMessage(HttpMethod.Post,"https://oauth2.googleapis.com/token");
            tokenRequest.Content=new FormUrlEncodedContent(new Dictionary<string,string>{
                ["client_id"]=read("ClientId")!,["client_secret"]=read("ClientSecret")!,
                ["refresh_token"]=read("RefreshToken")!,["grant_type"]="refresh_token"});
            using var tokenResponse=await client.SendAsync(tokenRequest,ct);
            if(tokenResponse.StatusCode==HttpStatusCode.TooManyRequests)return new("Retry",ErrorCode:"ProviderRateLimited");
            if(!tokenResponse.IsSuccessStatusCode)return new("Failed",ErrorCode:"GmailTokenRejected");
            using var data=JsonDocument.Parse(await tokenResponse.Content.ReadAsStringAsync(ct));
            accessToken=data.RootElement.TryGetProperty("access_token",out var token)&&token.ValueKind==JsonValueKind.String?token.GetString():null;
            if(string.IsNullOrWhiteSpace(accessToken)||accessToken.Length>8192||accessToken.Any(c=>c<=32||c>=127))
                return new("Failed",ErrorCode:"GmailTokenInvalid");
        }
        catch(Exception e) when(e is HttpRequestException or OperationCanceledException or IOException or JsonException)
        {return new("Failed",ErrorCode:"GmailTokenUnavailable");}
        try
        {
            var raw=Convert.ToBase64String(Encoding.UTF8.GetBytes(Mime(item,mail,from!))).TrimEnd('=').Replace('+','-').Replace('/','_');
            using var request=new HttpRequestMessage(HttpMethod.Post,"https://gmail.googleapis.com/gmail/v1/users/me/messages/send");
            request.Headers.Authorization=new AuthenticationHeaderValue("Bearer",accessToken);
            request.Content=JsonContent.Create(new{raw});
            using var response=await client.SendAsync(request,ct);
            if(response.StatusCode==HttpStatusCode.TooManyRequests)return new("Retry",ErrorCode:"ProviderRateLimited");
            if((int)response.StatusCode>=500)return new("Unknown",ErrorCode:"ProviderOutcomeUnknown");
            if(!response.IsSuccessStatusCode)return new("Failed",ErrorCode:"ProviderRejected");
            // Accepted is not inbox delivery. Never log or return provider body.
            try
            {
                using var body=JsonDocument.Parse(await response.Content.ReadAsStringAsync(ct));
                var id=body.RootElement.TryGetProperty("id",out var value)&&value.ValueKind==JsonValueKind.String?value.GetString():null;
                return new("Accepted",id is {Length:<=250}?id:null);
            }
            catch(JsonException){return new("Accepted");}
        }
        catch(Exception e) when(e is HttpRequestException or OperationCanceledException or IOException)
        {return new("Unknown",ErrorCode:"TransportOutcomeUnknown");}
    }
}
