variable "do_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account in which to manage the jnsgr.uk and sgrs.uk zones."
  type        = string
}
