resource "digitalocean_domain" "sgrsuk" {
  name = "sgrs.uk"
}

# NS Records

resource "digitalocean_record" "sgrsuk-ns1" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "sgrsuk-ns2" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "sgrsuk-ns3" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

# A Records

resource "digitalocean_record" "sgrsuk-mail-1" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "A"
  name   = "mail"
  value  = "66.111.4.147"
  ttl    = 3600
}

resource "digitalocean_record" "sgrsuk-mail-2" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "A"
  name   = "mail"
  value  = "66.111.4.148"
  ttl    = 3600
}

# CNAME Records

resource "digitalocean_record" "sgrsuk-dkim1" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "CNAME"
  name   = "fm1._domainkey"
  value  = "fm1.sgrs.uk.dkim.fmhosted.com."
  ttl    = 3600
}

resource "digitalocean_record" "sgrsuk-dkim2" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "CNAME"
  name   = "fm2._domainkey"
  value  = "fm2.sgrs.uk.dkim.fmhosted.com."
  ttl    = 3600
}

resource "digitalocean_record" "sgrsuk-dkim3" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "CNAME"
  name   = "fm3._domainkey"
  value  = "fm3.sgrs.uk.dkim.fmhosted.com."
  ttl    = 3600
}

# TXT Records

resource "digitalocean_record" "sgrsuk-fastmail-spf" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:spf.messagingengine.com ?all"
  ttl    = 3600
}

resource "digitalocean_record" "sgrsuk-keyoxide" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "TXT"
  name   = "@"
  value  = "openpgp4fpr:83b266dcf3e3f2b41264a9f5f4a9184451bd9a74"
  ttl    = 3600
}

# MX Records

resource "digitalocean_record" "sgrsuk-fastmail-1" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "MX"
  name     = "@"
  value    = "in1-smtp.messagingengine.com."
  priority = 10
  ttl      = 3600
}

resource "digitalocean_record" "sgrsuk-fastmail-2" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "MX"
  name     = "@"
  value    = "in2-smtp.messagingengine.com."
  priority = 20
  ttl      = 3600
}

# SRV Records

# SMTP Auto-Discovery
resource "digitalocean_record" "sgrsuk-smtp-auto" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "SRV"
  name     = "_submission._tcp"
  value    = "smtp.fastmail.com."
  port     = 587
  weight   = 1
  priority = 0
  ttl      = 3600
}

# IMAP Auto-Discovery
resource "digitalocean_record" "sgrsuk-imap-auto" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "SRV"
  name     = "_imap._tcp"
  value    = "."
  port     = 0
  weight   = 0
  priority = 0
  ttl      = 3600
}

resource "digitalocean_record" "sgrsuk-imaps-auto" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "SRV"
  name     = "_imaps._tcp"
  value    = "imap.fastmail.com."
  port     = 993
  weight   = 1
  priority = 0
  ttl      = 3600
}

# JMAP Auto-Discovery
resource "digitalocean_record" "sgrsuk-jmap-auto" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "SRV"
  name     = "_jmap._tcp"
  value    = "jmap.fastmail.com."
  port     = 443
  weight   = 1
  priority = 0
  ttl      = 3600
}

# CardDAV Auto-Discovery
resource "digitalocean_record" "sgrsuk-carddav-auto" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "SRV"
  name     = "_carddav._tcp"
  value    = "."
  port     = 0
  weight   = 0
  priority = 0
  ttl      = 3600
}

resource "digitalocean_record" "sgrsuk-carddavs-auto" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "SRV"
  name     = "_carddavs._tcp"
  value    = "carddav.fastmail.com."
  port     = 443
  weight   = 1
  priority = 0
  ttl      = 3600
}

# CalDAV Auto-Discovery
resource "digitalocean_record" "sgrsuk-caldav-auto" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "SRV"
  name     = "_caldav._tcp"
  value    = "."
  port     = 0
  weight   = 0
  priority = 0
  ttl      = 3600
}

resource "digitalocean_record" "sgrsuk-caldavs-auto" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "SRV"
  name     = "_caldavs._tcp"
  value    = "caldav.fastmail.com."
  port     = 443
  weight   = 1
  priority = 0
  ttl      = 3600
}
