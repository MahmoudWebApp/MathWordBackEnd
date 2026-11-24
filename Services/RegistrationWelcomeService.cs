namespace MathWorldAPI.Services;

/// <summary>Best-effort after a new account has committed. Never makes login or
/// registration depend on mail configuration or the external provider.</summary>
public sealed class RegistrationWelcomeService(IServiceScopeFactory scopes,IConfiguration config,
    ILogger<RegistrationWelcomeService> logger)
{
    public async Task QueueForNewStudentAsync(int id,string locale)
    {
        if(!config.GetValue<bool>("MathWorldEmail:WelcomeOnRegistrationEnabled"))return;
        try
        {
            using var scope=scopes.CreateScope();
            using var timeout=new CancellationTokenSource(TimeSpan.FromSeconds(5));
            // A new user starts with token version zero. A changed session,
            // disabled account or already verified mailbox cannot issue a grant.
            var verification=scope.ServiceProvider.GetRequiredService<EmailVerificationService>();
            await verification.RequestAsync(id,0,locale,timeout.Token);
        }
        catch(Exception)
        {
            // No recipient, credentials, token or raw database errors in logs.
            // A student may request a fresh confirmation from settings.
            logger.LogWarning("Automatic welcome could not be queued; account creation remains successful.");
        }
    }
}
