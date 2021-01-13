resource "digitalocean_domain" "jnsgruk" {
  name = "jnsgr.uk"
}

# NS Records

resource "digitalocean_record" "jnsgruk-ns1" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jnsgruk-ns2" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
  ttl    = 1800
}
resource "digitalocean_record" "jnsgruk-ns3" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
  ttl    = 1800
}

# A Records

resource "digitalocean_record" "jnsgruk-apex" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-bin" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "bin"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-cloud" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "cloud"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-monitor" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "monitor"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-wg" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "wg"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

resource "digitalocean_record" "jnsgruk-www" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "A"
  name   = "www"
  value  = digitalocean_droplet.droplet_jnsgruk.ipv4_address
  ttl    = 3600
}

# TXT Records

resource "digitalocean_record" "jnsgruk-keybase-proof" {
  domain = digitalocean_domain.jnsgruk.id
  type   = "TXT"
  name   = "@"
  value  = "keybase-site-verification=kim2lHkuXnd-QgMAhiQHJYJNNS2TDXkZe-as4L6drpA"
  ttl    = 3600
}