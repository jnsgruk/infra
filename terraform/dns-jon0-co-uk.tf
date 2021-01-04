resource "digitalocean_domain" "jon0" {
  name = "jon0.co.uk"
}

# NS Records

resource "digitalocean_record" "jon0-ns1" {
  domain = digitalocean_domain.jon0.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jon0-ns2" {
  domain = digitalocean_domain.jon0.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jon0-ns3" {
  domain = digitalocean_domain.jon0.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}