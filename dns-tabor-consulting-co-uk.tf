resource "digitalocean_domain" "taborconsulting" {
  name = "tabor-consulting.co.uk"
}

# NS Records

resource "digitalocean_record" "taborconsulting-ns1" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "taborconsulting-ns2" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "taborconsulting-ns3" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

# A Records

resource "digitalocean_record" "taborconsulting-apex" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "A"
  name   = "@"
  value  = "66.241.125.53"
  ttl    = 3600
}

resource "digitalocean_record" "taborconsulting-www" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "A"
  name   = "www"
  value  = "66.241.125.53"
  ttl    = 3600
}

# AAAA
resource "digitalocean_record" "taborconsulting-fly-aaaa" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "AAAA"
  name   = "@"
  value  = "2a09:8280:1::4e:a275:0"
  ttl    = 3600
}

resource "digitalocean_record" "taborconsulting-fly-aaaa-www" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "AAAA"
  name   = "@"
  value  = "2a09:8280:1::4e:a275:0"
  ttl    = 3600
}

resource "digitalocean_record" "taborconsulting-fly-cert-validation-apex" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "CNAME"
  name   = "_acme-challenge"
  value  = "tabor-consulting.co.uk.wp9qy8.flydns.net."
  ttl    = 3600
}

resource "digitalocean_record" "taborconsulting-fly-cert-validation-www" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "CNAME"
  name   = "_acme-challenge.www"
  value  = "www.tabor-consulting.co.uk.wp9qy8.flydns.net."
  ttl    = 3600
}

