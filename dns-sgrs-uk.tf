resource "cloudflare_zone" "sgrsuk" {
  account = {
    id = var.cloudflare_account_id
  }
  name = "sgrs.uk"
  type = "full"
}

resource "cloudflare_dns_record" "sgrsuk-dkim1" {
  zone_id = cloudflare_zone.sgrsuk.id
  type    = "CNAME"
  name    = "sig1._domainkey.sgrs.uk"
  content = "sig1.dkim.sgrs.uk.at.icloudmailadmin.com."
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "sgrsuk-icloud-txt" {
  zone_id = cloudflare_zone.sgrsuk.id
  type    = "TXT"
  name    = "sgrs.uk"
  content = "\"apple-domain=1ngUGi1besStkaHI\""
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "sgrsuk-icloud-spf" {
  zone_id = cloudflare_zone.sgrsuk.id
  type    = "TXT"
  name    = "sgrs.uk"
  content = "\"v=spf1 include:icloud.com ~all\""
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "sgrsuk-keyoxide" {
  zone_id = cloudflare_zone.sgrsuk.id
  type    = "TXT"
  name    = "sgrs.uk"
  content = "\"openpgp4fpr:4518bcc11bc096b80e5fbbaf337587962d8749a0\""
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "sgrsuk-icloud-1" {
  zone_id  = cloudflare_zone.sgrsuk.id
  type     = "MX"
  name     = "sgrs.uk"
  content  = "mx01.mail.icloud.com."
  priority = 10
  ttl      = 3600
  proxied  = false
}

resource "cloudflare_dns_record" "sgrsuk-icloud-2" {
  zone_id  = cloudflare_zone.sgrsuk.id
  type     = "MX"
  name     = "sgrs.uk"
  content  = "mx02.mail.icloud.com."
  priority = 10
  ttl      = 3600
  proxied  = false
}

# Start without enforcement while mail authentication is verified after cutover.
resource "cloudflare_dns_record" "sgrsuk-dmarc" {
  zone_id = cloudflare_zone.sgrsuk.id
  type    = "TXT"
  name    = "_dmarc.sgrs.uk"
  content = "\"v=DMARC1; p=none\""
  ttl     = 3600
  proxied = false
}

output "sgrsuk_name_servers" {
  description = "Set these nameservers at the registrar after verifying the Cloudflare zone."
  value       = cloudflare_zone.sgrsuk.name_servers
}
