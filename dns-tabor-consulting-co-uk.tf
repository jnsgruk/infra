resource "cloudflare_zone" "taborconsulting" {
  account = {
    id = var.cloudflare_account_id
  }
  name = "tabor-consulting.co.uk"
  type = "full"
}

# Preserve existing answers while changing authoritative DNS providers.

resource "cloudflare_dns_record" "taborconsulting-apex" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "A"
  name    = "tabor-consulting.co.uk"
  content = "66.241.125.53"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-www" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "A"
  name    = "www.tabor-consulting.co.uk"
  content = "66.241.125.53"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-fly-aaaa" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "AAAA"
  name    = "tabor-consulting.co.uk"
  content = "2a09:8280:1::4e:a275:0"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-fly-aaaa-www" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "AAAA"
  name    = "www.tabor-consulting.co.uk"
  content = "2a09:8280:1::4e:a275:0"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-fly-cert-validation-apex" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "CNAME"
  name    = "_acme-challenge.tabor-consulting.co.uk"
  content = "tabor-consulting.co.uk.wp9qy8.flydns.net."
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-fly-cert-validation-www" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "CNAME"
  name    = "_acme-challenge.www.tabor-consulting.co.uk"
  content = "www.tabor-consulting.co.uk.wp9qy8.flydns.net."
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-ms-office-autodiscover" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "CNAME"
  name    = "autodiscover.tabor-consulting.co.uk"
  content = "autodiscover.outlook.com."
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-ms-office-dkim-1" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "CNAME"
  name    = "selector1._domainkey.tabor-consulting.co.uk"
  content = "selector1-taborconsulting-co-uk01c._domainkey.Taborconsultingltd.onmicrosoft.com."
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-ms-office-dkim-2" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "CNAME"
  name    = "selector2._domainkey.tabor-consulting.co.uk"
  content = "selector2-taborconsulting-co-uk01c._domainkey.Taborconsultingltd.onmicrosoft.com."
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-ms-office" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "TXT"
  name    = "tabor-consulting.co.uk"
  content = "\"MS=ms80532337\""
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-ms-office-spf" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "TXT"
  name    = "tabor-consulting.co.uk"
  content = "\"v=spf1 include:spf.protection.outlook.com -all\""
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "taborconsulting-ms-office-mx" {
  zone_id  = cloudflare_zone.taborconsulting.id
  type     = "MX"
  name     = "tabor-consulting.co.uk"
  content  = "taborconsulting-co-uk01c.mail.protection.outlook.com."
  ttl      = 3600
  proxied  = false
  priority = 0
}

output "taborconsulting_name_servers" {
  description = "Set these nameservers at the registrar after verifying the Cloudflare zone."
  value       = cloudflare_zone.taborconsulting.name_servers
}
