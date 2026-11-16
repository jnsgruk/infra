# Personal Infrastructure

This repo contains the Infrastructure-as-Code that manages my personal infrastructure using
`terraform`. It manages DNS for:

- [jnsgr.uk](./dns-jnsgr-uk.tf) on Cloudflare (DNS-only, without the HTTP proxy).
- [sgrs.uk](./dns-sgrs-uk.tf) on DigitalOcean.
- [tabor-consulting.co.uk](./dns-tabor-consulting-co-uk.tf) on DigitalOcean.

Web pages are hosted on [Fly](https://fly.io):

- [jnsgr.uk](https://jnsgr.uk) / [Source](https://github.com/jnsgruk/jnsgr.uk)

## Getting Started

Requires Terraform >= 1.7 for the non-destructive `removed` blocks.

Supply these environment variables through your secret manager or an untracked `.env` file:

```bash
# Access key for the Azure Storage Account storing the Terraform state
ARM_ACCESS_KEY="..."
TF_VAR_do_token="..."
CLOUDFLARE_API_TOKEN="..."
TF_VAR_cloudflare_account_id="..."
```

Use a Cloudflare API token with Zone:Zone:Edit (for zone creation) and
Zone:DNS:Edit for the intended account/zone. Do not use the Global API Key.
If the zone is already created, Zone:Zone:Read and Zone:DNS:Edit scoped to
`jnsgr.uk` suffice after importing it. Keep credentials out of git.

For GitHub deployment, keep the existing `ARM_ACCESS_KEY` and `TF_VAR_do_token`
repository secrets, add the `CLOUDFLARE_API_TOKEN` repository secret, and set the
`CLOUDFLARE_ACCOUNT_ID` repository variable. Configure these before merging:
merges/pushes to `main` automatically apply the configuration after validation.
PRs only initialise with `-backend=false` and validate without production credentials.

```bash
git clone https://github.com/jnsgruk/infra
cd infra
# If using .env, load the trusted file and export its variables:
set -a
. ./.env
set +a
terraform init
terraform plan -out=terraform.tfplan
# Review the plan before applying it:
terraform apply terraform.tfplan
```
