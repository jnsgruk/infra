resource "cloudflare_zone" "jnsgruk" {
  account = {
    id = var.cloudflare_account_id
  }
  name = "jnsgr.uk"
  type = "full"
}

# Cloudflare owns the apex DNS and TLS certificate through this binding.
# The website repository owns the existing Worker's code/assets, not its routes.
# Existing apex A/AAAA records must be removed before creating this binding.
resource "cloudflare_workers_custom_domain" "jnsgruk" {
  account_id       = var.cloudflare_account_id
  zone_id          = cloudflare_zone.jnsgruk.id
  hostname         = cloudflare_zone.jnsgruk.name
  service          = "website"
  enabled          = true
  previews_enabled = false
}

# Originless, proxied DNS lets Single Redirects handle www without an origin.
resource "cloudflare_dns_record" "jnsgruk-www" {
  zone_id = cloudflare_zone.jnsgruk.id
  type    = "A"
  name    = "www.jnsgr.uk"
  content = "192.0.2.0"
  ttl     = 1
  proxied = true
}

# One zone entry point per phase. If one already exists, import it and preserve
# ALL existing rules before adding these two.
resource "cloudflare_ruleset" "jnsgruk_redirects" {
  zone_id     = cloudflare_zone.jnsgruk.id
  name        = "jnsgr.uk redirects"
  description = "Canonical website hostname and apex HTTPS"
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  rules = [
    {
      ref         = "www_to_apex"
      description = "Redirect www to the HTTPS apex, preserving path and query"
      expression  = "(http.host eq \"www.jnsgr.uk\")"
      action      = "redirect"
      enabled     = true
      action_parameters = {
        from_value = {
          status_code = 301
          target_url = {
            expression = "concat(\"https://jnsgr.uk\", http.request.uri.path)"
          }
          preserve_query_string = true
        }
      }
    },
    {
      ref         = "apex_https"
      description = "Enforce HTTPS only for the apex"
      expression  = "(http.host eq \"jnsgr.uk\" and http.request.scheme eq \"http\")"
      action      = "redirect"
      enabled     = true
      action_parameters = {
        from_value = {
          status_code = 301
          target_url = {
            expression = "concat(\"https://jnsgr.uk\", http.request.uri.path)"
          }
          preserve_query_string = true
        }
      }
    }
  ]
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
