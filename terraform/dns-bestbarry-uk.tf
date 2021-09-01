resource "digitalocean_domain" "bestbarry" {
  name = "bestbarry.uk"
}

# NS Records

resource "digitalocean_record" "bestbarry-ns1" {
  domain = digitalocean_domain.bestbarry.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "bestbarry-ns2" {
  domain = digitalocean_domain.bestbarry.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "bestbarry-ns3" {
  domain = digitalocean_domain.bestbarry.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

# A Records

resource "digitalocean_record" "bestbarry-apex" {
  domain = digitalocean_domain.bestbarry.id
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "bestbarry-www" {
  domain = digitalocean_domain.bestbarry.id
  type   = "A"
  name   = "www"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}
