resource "digitalocean_domain" "jviccarsuk" {
  name = "jviccars.uk"
}

# NS Records

resource "digitalocean_record" "jviccarsuk-ns1" {
  domain = digitalocean_domain.jviccarsuk.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jviccarsuk-ns2" {
  domain = digitalocean_domain.jviccarsuk.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jviccarsuk-ns3" {
  domain = digitalocean_domain.jviccarsuk.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

# CNAME Records

resource "digitalocean_record" "jviccarsuk-dkim1" {
  domain = digitalocean_domain.jviccarsuk.id
  type   = "CNAME"
  name   = "fm1._domainkey"
  value  = "fm1.jviccars.uk.dkim.fmhosted.com."
  ttl    = 3600
}

resource "digitalocean_record" "jviccarsuk-dkim2" {
  domain = digitalocean_domain.jviccarsuk.id
  type   = "CNAME"
  name   = "fm2._domainkey"
  value  = "fm2.jviccars.uk.dkim.fmhosted.com."
  ttl    = 3600
}

resource "digitalocean_record" "jviccarsuk-dkim3" {
  domain = digitalocean_domain.jviccarsuk.id
  type   = "CNAME"
  name   = "fm3._domainkey"
  value  = "fm3.jviccars.uk.dkim.fmhosted.com."
  ttl    = 3600
}

# TXT Records

resource "digitalocean_record" "jviccarsuk-fastmail-spf" {
  domain = digitalocean_domain.jviccarsuk.id
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:spf.messagingengine.com ?all"
  ttl    = 3600
}

# MX Records

resource "digitalocean_record" "jviccarsuk-fastmail-1" {
  domain   = digitalocean_domain.jviccarsuk.id
  type     = "MX"
  name     = "@"
  value    = "in1-smtp.messagingengine.com."
  priority = 10
  ttl      = 3600
}

resource "digitalocean_record" "jviccarsuk-fastmail-2" {
  domain   = digitalocean_domain.jviccarsuk.id
  type     = "MX"
  name     = "@"
  value    = "in2-smtp.messagingengine.com."
  priority = 20
  ttl      = 3600
}
