variable "do_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account in which to manage the jnsgr.uk zone."
  type        = string
}
