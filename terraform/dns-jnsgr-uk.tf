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
  value  = "37.16.31.92"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-www" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "www"
  value  = "37.16.31.92"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-dash" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "dash"
  value  = "100.67.109.40"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-backup" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "backup"
  value  = "100.67.109.40"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-files" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "files"
  value  = "100.67.109.40"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-sync" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "*.sync"
  value  = "100.67.109.40"
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

resource "digitalocean_record" "jnsgruk-dkim1" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "CNAME"
  name   = "fm1._domainkey"
  value  = "fm1.jnsgr.uk.dkim.fmhosted.com."
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-dkim2" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "CNAME"
  name   = "fm2._domainkey"
  value  = "fm2.jnsgr.uk.dkim.fmhosted.com."
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-dkim3" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "CNAME"
  name   = "fm3._domainkey"
  value  = "fm3.jnsgr.uk.dkim.fmhosted.com."
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-fly-wildcard-cert-validation" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "CNAME"
  name   = "_acme-challenge"
  value  = "jnsgr.uk.9w6nj.flydns.net."
  ttl    = 3600
}

# TXT Records

resource "digitalocean_record" "jnsgruk-keybase-proof" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "TXT"
  name   = "@"
  value  = "keybase-site-verification=kim2lHkuXnd-QgMAhiQHJYJNNS2TDXkZe-as4L6drpA"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-fastmail-spf" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:spf.messagingengine.com ?all"
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-keyoxide" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "TXT"
  name   = "@"
  value  = "openpgp4fpr:83b266dcf3e3f2b41264a9f5f4a9184451bd9a74"
  ttl    = 3600
}


# MX Records

resource "digitalocean_record" "jnsgruk-fastmail-1" {
  domain   = digitalocean_domain.jnsgruk.id
  type     = "MX"
  name     = "@"
  value    = "in1-smtp.messagingengine.com."
  priority = 10
  ttl      = 3600
}

resource "digitalocean_record" "jnsgruk-fastmail-2" {
  domain   = digitalocean_domain.jnsgruk.id
  type     = "MX"
  name     = "@"
  value    = "in2-smtp.messagingengine.com."
  priority = 20
  ttl      = 3600
}
