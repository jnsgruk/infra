resource "digitalocean_domain" "jnsgruk" {
  name = "jnsgr.uk"
}

# NS Records

resource "digitalocean_record" "jnsgruk-ns1" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jnsgruk-ns2" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jnsgruk-ns3" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

# A Records

resource "digitalocean_record" "jnsgruk-apex" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "@"
  value  = "137.66.21.13"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-www" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "www"
  value  = "137.66.21.13"
  ttl    = 3600
}

# AAAA
resource "digitalocean_record" "jnsgruk-fly-cert-validation" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "AAAA"
  name   = "@"
  value  = "2a09:8280:1::6bb6"
  ttl    = 3600
}

# CNAME Records

resource "digitalocean_record" "jnsgruk-fly-wildcard-cert-validation" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "CNAME"
  name   = "_acme-challenge"
  value  = "jnsgr.uk.9w6nj.flydns.net."
  ttl    = 3600
}

# TXT Records

resource "digitalocean_record" "jnsgruk-bluesky" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "TXT"
  name   = "_atproto"
  value  = "did=did:plc:tdlofy3jhbdmn4t6uwnpkjfa"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-keybase-proof" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "TXT"
  name   = "@"
  value  = "keybase-site-verification=kim2lHkuXnd-QgMAhiQHJYJNNS2TDXkZe-as4L6drpA"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-keyoxide" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "TXT"
  name   = "@"
  value  = "openpgp4fpr:4518bcc11bc096b80e5fbbaf337587962d8749a0"
  ttl    = 3600
}
