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