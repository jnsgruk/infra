terraform {
  required_version = ">= 1.7.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.29.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~>2.0"
    }
  }

  backend "azurerm" {
    storage_account_name = "jnsgruktf"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "digitalocean" {
  token = var.do_token
}

# Authentication is supplied through CLOUDFLARE_API_TOKEN.
provider "cloudflare" {}
