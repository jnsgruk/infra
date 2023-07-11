# Personal Infrastructure

This repo contains the Infrastructure-as-Code that manages my personal infrastructure using
`terraform`. It currently manages:

- DNS Records for my domains:
  - [bestbarry.uk](./terraform/bestbarry-uk.tf)
  - [ctrl-elk-del.com](./terraform/dns-ctrl-elk-del-com.tf)
  - [jnsgr.uk](./terraform/dns-jnsgr-uk.tf)
  - [jseager.co.uk](./terraform/dns-jseager-co-uk.tf)
  - [jon0.co.uk](./terraform/dns-jon0-co-uk.tf)
  - [sgrs.uk](./terraform/dns-sgrs-uk.tf)

Web pages are hosted on [Fly](https://fly.io):

- [jnsgr.uk](https://jnsgr.uk) / [Source](https://github.com/jnsgruk/jnsgr.uk)
- [bestbarry.uk](https://bestbarry.uk)

## Getting Started

### Creating the `dotenv` file

The `.env` file should be created at the root of the repository in the following form:

```bash
# Access key for the Azure Storage Account storing the Terraform state
ARM_ACCESS_KEY="deadbeef"
TF_VAR_do_token="deadbeef"
EMAIL="foo@bar.org"
```

### Provisioning the Infrastructure

To build the infrastructure with Terraform:

```bash
$ git clone https://github.com/jnsgruk/infra
$ cd infra
# Export the variables from the env file
$ export $(grep -v "#" .env | xargs)
# Initialise Terraform
$ terraform init
# Deploy the infrastructure
$ terraform apply
```
