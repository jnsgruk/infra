resource "digitalocean_domain" "jseager" {
  name = "jseager.co.uk"
}

# NS Records

resource "digitalocean_record" "jseager-ns1" {
  domain = digitalocean_domain.jseager.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jseager-ns2" {
  domain = digitalocean_domain.jseager.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jseager-ns3" {
  domain = digitalocean_domain.jseager.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

# TXT records

resource "digitalocean_record" "jseager-keyoxide" {
  domain = digitalocean_domain.jseager.id
  type   = "TXT"
  name   = "@"
  value  = "openpgp4fpr:83b266dcf3e3f2b41264a9f5f4a9184451bd9a74"
  ttl    = 3600
}
