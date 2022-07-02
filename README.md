# Personal Infrastructure

This repo contains the Infrastructure-as-Code that creates my personal infrastructure using
`docker-compose` and `terraform`. It currently manages:

- [A DigitalOcean Droplet](./terraform/personal-infra.tf)
- [A DigitalOcean Firewall](./terraform/personal-infra.tf)
- DNS Records for my domains:
  - [bestbarry.uk](./terraform/bestbarry-uk.tf)
  - [ctrl-elk-del.com](./terraform/dns-ctrl-elk-del-com.tf)
  - [jnsgr.uk](./terraform/dns-jnsgr-uk.tf)
  - [jseager.co.uk](./terraform/dns-jseager-co-uk.tf)
  - [jon0.co.uk](./terraform/dns-jon0-co-uk.tf)
  - [sgrs.uk](./terraform/dns-sgrs-uk.tf)

It manages the following services on the Droplet:

- [traefik](https://traefik.io)
- [watchtower](https://github.com/containrrr/watchtower)
- [jnsgr.uk](https://github.com/jnsgruk/jnsgr.uk)
- [bestbarry.uk](https://bestbarry.uk)

It manages the following services on the Fitlet:

- [traefik](https://traefik.io)
- [watchtower](https://github.com/containrrr/watchtower)
- [duplicati](https://www.duplicati.com/)
- [syncthing](https://syncthing.net/)

Traefik is configured to redirect all domains to `HTTPS`, and all certs are automatically issued
from LetsEncrypt (provided the relevant DNS records are in place). On the Droplet, Traefik uses the
HTTP Challenge provider for LetsEncrypt, on the Fitlet it uses the DNS Challenge provider.

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
# Data paths on Fitlet
FITLET_DATA_ROOT="/some/path"
FITLET_APPS_ROOT="${FITLET_DATA_ROOT}/infra"
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

Once the droplet is provisioned, install [`docker`](https://docs.docker.com/engine/install/ubuntu/)
and [`docker-compose`](https://docs.docker.com/compose/install/compose-plugin/).

```bash
# Clone the repo
$ git clone https://github.com/jnsgruk/infra
# Change into the repo directory
$ cd infra
# Set the COMPOSE_PROFILES variable to either 'droplet' or 'fitlet'
$ export COMPOSE_PROFILES=droplet
# Create the infrastructure
$ docker compose up -d
```
