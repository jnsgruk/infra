# Personal Infrastructure

Terraform configuration for:

- [jnsgr.uk](./dns-jnsgr-uk.tf) on Cloudflare.
- [sgrs.uk](./dns-sgrs-uk.tf) on Cloudflare.
- [tabor-consulting.co.uk](./dns-tabor-consulting-co-uk.tf) on Cloudflare (DNS-only).

The `jnsgr.uk` apex uses the existing Cloudflare Worker `website`. Its Custom
Domain manages DNS and TLS automatically. `www` uses a proxied, originless A
record (`192.0.2.0`) and redirects to the HTTPS apex, preserving paths and queries.
A separate apex-only redirect enforces HTTPS without changing zone settings.
Coffee, books, identity proofs and shared Fly certificate-validation records
remain unchanged in Cloudflare.

Terraform owns domain bindings, DNS and redirects. The
[website repository](https://github.com/jnsgruk/jnsgr.uk) owns Worker code and assets;
its Wrangler configuration must not also own the domain routes.

## Setup

Requires Terraform >= 1.7. The Cloudflare provider is pinned to `~> 5.29.0`.
State is stored in Azure Blob Storage.

Supply credentials through environment variables:

```bash
ARM_ACCESS_KEY="..."
TF_VAR_do_token="..."
CLOUDFLARE_API_TOKEN="..."
TF_VAR_cloudflare_account_id="..."
```

The Cloudflare token needs access to the intended account/zone for zone reads
(Edit if creating a zone), DNS edits, Workers Scripts edits and Dynamic Redirect
edits. Credentials, Terraform state and saved plans must stay out of git.

```bash
terraform init
terraform plan -out=terraform.tfplan
terraform show terraform.tfplan
```

For validation without backend access:

```bash
terraform fmt -check dns-jnsgr-uk.tf dns-sgrs-uk.tf dns-tabor-consulting-co-uk.tf dns-tabor-consulting-co-uk-migration.tf provider.tf variables.tf
terraform init -backend=false
terraform validate
```

## Deployment

Pull requests validate without production credentials. Pushes to `main`
automatically apply using the repository secrets and `CLOUDFLARE_ACCOUNT_ID` variable.
