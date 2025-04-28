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

# CNAME Records

resource "digitalocean_record" "sgrsuk-dkim1" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "CNAME"
  name   = "sig1._domainkey"
  value  = "sig1.dkim.sgrs.uk.at.icloudmailadmin.com."
  ttl    = 3600
}

# TXT Records

resource "digitalocean_record" "sgrsuk-icloud-txt" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "TXT"
  name   = "@"
  value  = "apple-domain=1ngUGi1besStkaHI"
  ttl    = 3600
}

resource "digitalocean_record" "sgrsuk-icloud-spf" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:icloud.com ~all"
  ttl    = 3600
}

resource "digitalocean_record" "sgrsuk-keyoxide" {
  domain = digitalocean_domain.sgrsuk.id
  type   = "TXT"
  name   = "@"
  value  = "openpgp4fpr:4518bcc11bc096b80e5fbbaf337587962d8749a0"
  ttl    = 3600
}

# MX Records

resource "digitalocean_record" "sgrsuk-icloud-1" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "MX"
  name     = "@"
  value    = "mx01.mail.icloud.com."
  priority = 10
  ttl      = 3600
}

resource "digitalocean_record" "sgrsuk-icloud-2" {
  domain   = digitalocean_domain.sgrsuk.id
  type     = "MX"
  name     = "@"
  value    = "mx02.mail.icloud.com."
  priority = 10
  ttl      = 3600
}
