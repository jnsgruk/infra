# Personal Infrastructure

This repo contains the Infrastructure-as-Code that manages my personal infrastructure using
`docker-compose` and `terraform`. It currently manages:

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

It manages the following services:

- [traefik](https://traefik.io)
- [watchtower](https://github.com/containrrr/watchtower)
- [duplicati](https://www.duplicati.com/)
- [syncthing](https://syncthing.net/)

Traefik is configured to redirect all domains to `HTTPS`, and all certs are automatically issued
from LetsEncrypt or Tailscale.

## Getting Started

### Creating the `dotenv` file

The `.env` file should be created at the root of the repository in the following form:

```bash
# Access key for the Azure Storage Account storing the Terraform state
ARM_ACCESS_KEY="deadbeef"
# API Key for DigitalOcean for DNS record creation (by Traefik & Terraform)
DO_AUTH_TOKEN="deadbeef"
TF_VAR_do_token="deadbeef"
# Admin email address for LetsEncrypt
EMAIL="foo@bar.org"
# Data paths
DATA_ROOT="/some/path"
APPS_ROOT="${DATA_ROOT}/infra"
```

### Provisioning the Infrastructure

To build the infrastructure with Terraform:

```bash
$ git clone https://github.com/jnsgruk/infra
$ cd infra
# Export the variables from the env file
$ export $(grep -v "#" .env | xargs)
# Change into the terraform directory
$ cd terraform
# Initialise Terraform
$ terraform init
# Deploy the infrastructure
$ terraform apply
```

### Deploying Services

Once machines are provisioned, install [`docker`](https://docs.docker.com/engine/install/ubuntu/)
and [`docker-compose`](https://docs.docker.com/compose/install/compose-plugin/).

```bash
# Clone the repo
$ git clone https://github.com/jnsgruk/infra
# Change into the repo directory
$ cd infra
# Create the infrastructure
$ docker compose up -d
```
