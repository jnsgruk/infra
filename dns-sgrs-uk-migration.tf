# Retain the old authoritative zone and records during delegation changes and
# rollback. These resources leave Terraform state without deleting live DNS.
removed {
  from = digitalocean_domain.sgrsuk
  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.sgrsuk-ns1
  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.sgrsuk-ns2
  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.sgrsuk-ns3
  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.sgrsuk-dkim1
  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.sgrsuk-icloud-txt
  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.sgrsuk-icloud-spf
  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.sgrsuk-keyoxide
  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.sgrsuk-icloud-1
  lifecycle {
    destroy = false
  }
}

removed {
  from = digitalocean_record.sgrsuk-icloud-2
  lifecycle {
    destroy = false
  }
}
