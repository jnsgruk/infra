resource "cloudflare_zone" "taborconsulting" {
  account = {
    id = var.cloudflare_account_id
  }
  name = "tabor-consulting.co.uk"
  type = "full"
}

# Cloudflare owns the apex DNS and TLS certificate through this binding.
# The website repository owns the existing Worker's code/assets, not its routes.
# Existing apex A/AAAA records must be removed before creating this binding.
resource "cloudflare_workers_custom_domain" "taborconsulting" {
  account_id       = var.cloudflare_account_id
  zone_id          = cloudflare_zone.taborconsulting.id
  hostname         = cloudflare_zone.taborconsulting.name
  service          = "tabor-consulting"
  enabled          = true
  previews_enabled = false
}


# One zone entry point per phase. If one already exists, import it and preserve
# ALL existing rules before adding these two.
resource "cloudflare_ruleset" "taborconsulting_redirects" {
  zone_id     = cloudflare_zone.taborconsulting.id
  name        = "tabor-consulting.co.uk redirects"
  description = "Canonical website hostname and apex HTTPS"
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  rules = [
    {
      ref         = "www_to_apex"
      description = "Redirect www to the HTTPS apex, preserving path and query"
      expression  = "(http.host eq \"www.tabor-consulting.co.uk\")"
      action      = "redirect"
      enabled     = true
      action_parameters = {
        from_value = {
          status_code = 301
          target_url = {
            expression = "concat(\"https://tabor-consulting.co.uk\", http.request.uri.path)"
          }
          preserve_query_string = true
        }
      }
    },
    {
      ref         = "apex_https"
      description = "Enforce HTTPS only for the apex"
      expression  = "(http.host eq \"tabor-consulting.co.uk\" and not ssl)"
      action      = "redirect"
      enabled     = true
      action_parameters = {
        from_value = {
          status_code = 301
          target_url = {
            expression = "concat(\"https://tabor-consulting.co.uk\", http.request.uri.path)"
          }
          preserve_query_string = true
        }
      }
    }
  ]
}


resource "cloudflare_dns_record" "taborconsulting-www" {
  zone_id = cloudflare_zone.taborconsulting.id
  type    = "A"
  name    = "www.tabor-consulting.co.uk"
  content = "192.0.2.0"
  ttl     = 1
  proxied = true
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
