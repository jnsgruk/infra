# Personal Infrastructure

This repo contains the Infrastructure-as-Code that manages my personal infrastructure using
`terraform`. It currently manages:

- DNS Records for my domains:
  - [jnsgr.uk](./terraform/dns-jnsgr-uk.tf)
  - [sgrs.uk](./terraform/dns-sgrs-uk.tf)

Web pages are hosted on [Fly](https://fly.io):

- [jnsgr.uk](https://jnsgr.uk) / [Source](https://github.com/jnsgruk/jnsgr.uk)

## Getting Started

### Creating the `dotenv` file

The `.env` file should be created at the root of the repository in the following form:

```bash
# Access key for the Azure Storage Account storing the Terraform state
ARM_ACCESS_KEY="deadbeef"
TF_VAR_do_token="deadbeef"
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
