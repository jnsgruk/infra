resource "digitalocean_domain" "taborconsulting" {
  name = "tabor-consulting.co.uk"
}

# NS Records

resource "digitalocean_record" "taborconsulting-ns1" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "taborconsulting-ns2" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "taborconsulting-ns3" {
  domain = digitalocean_domain.taborconsulting.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

