resource "digitalocean_domain" "ctrlelkdel" {
  name = "ctrl-elk-del.com"
}

# NS Records

resource "digitalocean_record" "ced-ns1" {
  domain = digitalocean_domain.ctrlelkdel.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "ced-ns2" {
  domain = digitalocean_domain.ctrlelkdel.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "ced-ns3" {
  domain = digitalocean_domain.ctrlelkdel.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

# TXT Record

resource "digitalocean_record" "ced-keyoxide" {
  domain = digitalocean_domain.ctrlelkdel.id
  type   = "TXT"
  name   = "@"
  value  = "openpgp4fpr:83b266dcf3e3f2b41264a9f5f4a9184451bd9a74"
  ttl    = 3600
}
