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
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-stats" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "stats"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-bin" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "bin"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-cloud" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "cloud"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-irc" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "irc"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-monitor" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "monitor"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-wg" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "wg"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-www" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "www"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
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
