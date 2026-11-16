# Leave the old authoritative zone live for propagation and rollback.

removed {
  from = digitalocean_domain.taborconsulting

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-ns1

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-ns2

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-ns3

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-apex

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-www

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-fly-aaaa

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-fly-aaaa-www

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-fly-cert-validation-apex

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-fly-cert-validation-www

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-ms-office-autodiscover

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-ms-office-dkim-1

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-ms-office-dkim-2

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-ms-office

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-ms-office-spf

  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.taborconsulting-ms-office-mx

  lifecycle {
    destroy = false
  }
}
