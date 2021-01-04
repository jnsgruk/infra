# Droplet
resource "digitalocean_droplet" "droplet_jnsgruk" {
    name       = "jnsgruk"
    region     = "lon1"
    image      = "ubuntu-20-04-x64"
    size       = "s-1vcpu-2gb"
    monitoring = true
}

# Firewall
resource "digitalocean_firewall" "firewall_jnsgruk" {
  name        = "jnsgruk"
  droplet_ids = [digitalocean_droplet.droplet_jnsgruk.id]

  # Allow HTTPS traffic
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  # Allow HTTP traffic
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  # Allow Wireguard traffic
  inbound_rule {
    protocol         = "udp"
    port_range       = "51820"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Generic permissive outbound rules
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}