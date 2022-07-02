terraform {
  required_providers {
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
