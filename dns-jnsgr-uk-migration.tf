# Keep the old authoritative zone available during propagation and for rollback.
# These resources leave Terraform state without deleting anything in DigitalOcean.

removed {
  from = digitalocean_domain.jnsgruk

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-ns1

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-ns2

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-ns3

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-apex

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-www

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-fly-cert-validation

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-fly-coffee-cert-validation

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-fly-books-cert-validation

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-fly-wildcard-cert-validation

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-bluesky

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-keybase-proof

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.jnsgruk-keyoxide

  lifecycle {
    destroy = false
  }
}
