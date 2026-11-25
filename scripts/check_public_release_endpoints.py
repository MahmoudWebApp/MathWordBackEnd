#!/usr/bin/env python3
"""Read-only production smoke; fixed public origins, no tokens or account creation."""
import json
import time
from html.parser import HTMLParser
from urllib.request import Request, urlopen
from urllib.parse import urlsplit
from xml.etree import ElementTree as ET

WEB = "https://math-world-frontend.vercel.app"
API = "https://mathwordbackend.onrender.com"
MAX_BYTES = 3_000_000
class Links(HTMLParser):
    def __init__(self):
        super().__init__()
        self.links=[]
    def handle_starttag(self, tag, attrs):
        if tag=="link":
            self.links.append(dict(attrs))

def fetch(url, accept):
    start=time.monotonic()
    with urlopen(Request(url,headers={"User-Agent":"MathWorld-Release-Smoke/1.0","Accept":accept}),timeout=90) as r:
        assert r.status==200 and urlsplit(r.geturl()).netloc==urlsplit(url).netloc, "Unexpected HTTP target or status"
        raw=r.read(MAX_BYTES+1)
        assert len(raw)<=MAX_BYTES, "Response exceeds limit"
        elapsed=round((time.monotonic()-start)*1000)
        print(f"PASS HTTP 200 {url}; elapsed_ms={elapsed}",flush=True)
        return raw

def main():
    alive=json.loads(fetch(API+"/health/live","application/json"))
    assert alive.get("status")=="alive" and alive.get("service")=="MathWorld-Backend"
    ready=json.loads(fetch(API+"/health/ready","application/json"))
    assert (ready.get("status"),ready.get("database"),ready.get("schema"))==("ready","available","current")
    # A second readiness sample is a diagnostic, not a latency SLA.
    ready=json.loads(fetch(API+"/health/ready","application/json"))
    assert ready.get("status")=="ready"
    robots=fetch(WEB+"/robots.txt","text/plain").decode()
    rules={line.strip() for line in robots.splitlines()}
    for locale in ("ar","en"):
        for route in ("dashboard","admin","profile","notifications","learning-stage","social-accounts"):
            assert f"Disallow: /{locale}/{route}" in rules, "Missing private crawler boundary"
    assert f"Sitemap: {WEB}/sitemap.xml" in rules
    root=ET.fromstring(fetch(WEB+"/sitemap.xml","application/xml,text/xml"))
    locs={x.text for x in root.findall(".//{*}loc")}
    for locale in ("ar","en"):
        assert WEB+"/"+locale in locs
        assert WEB+"/"+locale+"/about" in locs
        assert WEB+"/"+locale+"/stages" in locs
    for loc in locs:
        assert loc.startswith(WEB+"/")
        assert not any("/"+route in urlsplit(loc).path.split("/"+locale,1)[-1] for locale in ("ar","en") for route in ("dashboard","admin","profile","notifications","reset-password"))
    for locale in ("ar","en"):
        links=Links()
        links.feed(fetch(WEB+"/"+locale+"/about","text/html").decode())
        assert any(x.get("rel")=="canonical" and x.get("href")==WEB+"/"+locale+"/about" for x in links.links)
        for lang in ("ar","en"):
            assert any(x.get("rel")=="alternate" and x.get("hreflang")==lang and x.get("href")==WEB+"/"+lang+"/about" for x in links.links)
    print("PASS public health/readiness and bilingual SEO; timings are diagnostic samples, not authenticated UAT or performance certification.")

if __name__=="__main__":
    main()
