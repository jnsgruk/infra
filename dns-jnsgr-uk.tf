resource "cloudflare_zone" "jnsgruk" {
  account = {
    id = var.cloudflare_account_id
  }
  name = "jnsgr.uk"
  type = "full"
}

# Preserve the existing DNS answers; Cloudflare proxying is deliberately disabled.

resource "cloudflare_dns_record" "jnsgruk-apex" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "A"
  name    = "jnsgr.uk"
  content = "137.66.21.13"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "jnsgruk-www" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "A"
  name    = "www.jnsgr.uk"
  content = "137.66.21.13"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "jnsgruk-fly-cert-validation" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "AAAA"
  name    = "jnsgr.uk"
  content = "2a09:8280:1::6bb6"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "jnsgruk-fly-coffee-cert-validation" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "CNAME"
  name    = "coffee.jnsgr.uk"
  content = "361ewn0.brewlog.fly.dev."
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "jnsgruk-fly-books-cert-validation" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "CNAME"
  name    = "books.jnsgr.uk"
  content = "2m8w5k9.booklog.fly.dev."
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "jnsgruk-fly-wildcard-cert-validation" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "CNAME"
  name    = "_acme-challenge.jnsgr.uk"
  content = "jnsgr.uk.9w6nj.flydns.net."
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "jnsgruk-bluesky" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "TXT"
  name    = "_atproto.jnsgr.uk"
  content = "\"did=did:plc:2upv75ffzfvf6pxucpcjwj6k\""
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "jnsgruk-keybase-proof" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "TXT"
  name    = "jnsgr.uk"
  content = "\"keybase-site-verification=kim2lHkuXnd-QgMAhiQHJYJNNS2TDXkZe-as4L6drpA\""
  ttl     = 3600
  proxied = false
}

resource "cloudflare_dns_record" "jnsgruk-keyoxide" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "TXT"
  name    = "jnsgr.uk"
  content = "\"openpgp4fpr:4518bcc11bc096b80e5fbbaf337587962d8749a0\""
  ttl     = 3600
  proxied = false
}

output "jnsgruk_name_servers" {
  description = "Set these nameservers at the registrar after verifying the Cloudflare zone."
  value       = cloudflare_zone.jnsgruk.name_servers
}
