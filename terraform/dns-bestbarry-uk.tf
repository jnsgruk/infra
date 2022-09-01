resource "digitalocean_domain" "bestbarry" {
  name = "bestbarry.uk"
}

# NS Records

resource "digitalocean_record" "bestbarry-ns1" {
  domain = digitalocean_domain.bestbarry.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "bestbarry-ns2" {
  domain = digitalocean_domain.bestbarry.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "bestbarry-ns3" {
  domain = digitalocean_domain.bestbarry.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

# A Records

resource "digitalocean_record" "bestbarry-apex" {
  domain = digitalocean_domain.bestbarry.id
  type   = "A"
  name   = "@"
  value  = "137.66.3.66"
  ttl    = 3600
}

resource "digitalocean_record" "bestbarry-www" {
  domain = digitalocean_domain.bestbarry.id
  type   = "A"
  name   = "www"
  value  = "137.66.3.66"
  ttl    = 3600
}

# AAAA Records
resource "digitalocean_record" "bestbarry-apex-ipv6" {
  domain = digitalocean_domain.bestbarry.id
  type   = "AAAA"
  name   = "@"
  value  = "2a09:8280:1::6:6c52"
  ttl    = 3600
}

resource "digitalocean_record" "bestbarry-www-ipv6" {
  domain = digitalocean_domain.bestbarry.id
  type   = "AAAA"
  name   = "@"
  value  = "2a09:8280:1::6:6c52"
  ttl    = 3600
}

# CNAME
resource "digitalocean_record" "bestbarry-fly-wildcard-cert-validation" {
  domain = digitalocean_domain.bestbarry.id
  type   = "CNAME"
  name   = "_acme-challenge"
  value  = "bestbarry.uk.5pmlx.flydns.net."
  ttl    = 3600
}
