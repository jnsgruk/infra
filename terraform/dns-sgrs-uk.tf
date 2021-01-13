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


# CNAME Records

// resource "digitalocean_record" "sgrsuk-dkim1" {
//   domain = digitalocean_domain.sgrsuk.id
//   type   = "CNAME"
//   name   = "fm1._domainkey"
//   value  = "fm1.sgrs.uk.dkim.fmhosted.com."
//   ttl    = 3600
// }

// resource "digitalocean_record" "sgrsuk-dkim2" {
//   domain = digitalocean_domain.sgrsuk.id
//   type   = "CNAME"
//   name   = "fm2._domainkey"
//   value  = "fm2.sgrs.uk.dkim.fmhosted.com."
//   ttl    = 3600
// }

// resource "digitalocean_record" "sgrsuk-dkim3" {
//   domain = digitalocean_domain.sgrsuk.id
//   type   = "CNAME"
//   name   = "fm3._domainkey"
//   value  = "fm3.sgrs.uk.dkim.fmhosted.com."
//   ttl    = 3600
// }

# TXT Records

// resource "digitalocean_record" "sgrsuk-fastmail-spf" {
//   domain = digitalocean_domain.sgrsuk.id
//   type   = "TXT"
//   name   = "@"
//   value  = "v=spf1 include:spf.messagingengine.com ?all"
//   ttl    = 3600
// }

# MX Records

// resource "digitalocean_record" "sgrsuk-fastmail-1" {
//   domain   = digitalocean_domain.sgrsuk.id
//   type     = "MX"
//   name     = "@"
//   value    = "in1-smtp.messagingengine.com."
//   priority = 10
//   ttl      = 3600
// }

// resource "digitalocean_record" "sgrsuk-fastmail-2" {
//   domain   = digitalocean_domain.sgrsuk.id
//   type     = "MX"
//   name     = "@"
//   value    = "in2-smtp.messagingengine.com."
//   priority = 20
//   ttl      = 3600
// }