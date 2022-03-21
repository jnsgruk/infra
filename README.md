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
  - [jviccars.uk](./terraform/jviccars-uk.tf)
  - [sgrs.uk](./terraform/dns-sgrs-uk.tf)

It also manages the following services on the droplet:

- [traefik](https://traefik.io)
- [jnsgr.uk](https://github.com/jnsgruk/jnsgr.uk)
- [watchtower](https://github.com/containrrr/watchtower)

Traefik is configured to redirect all domains to `HTTPS`, and all certs are automatically issued
from LetsEncrypt (provided the relevant DNS records are in place).

Secrets are managed using `dotenv` files encrypted with [sops](https://github.com/mozilla/sops).

## Getting Started

### Provisioning the Infrastructure

To build the infrastructure with Terraform:

```bash
$ git clone https://github.com/jnsgruk/infra
$ cd infra
# Decrypt secrets (follow prompts)
$ ./secrets.sh decrypt
# Export the variables from the terraform env file
$ export $(grep -v "#" env/terraform.env | xargs)
# Change into the terraform directory
$ cd terraform
# Initialise Terraform
$ terraform init
# Deploy the infrastructure
$ terraform apply
```

### Deploying Services

Once the droplet is provisioned, install `docker` and `docker-compose`, preferably using the
Ansible Roles in my [dotfiles/provisioning repository](https://jnsgr.uk/dotfiles).

The `docker-compose` file relies upon a number of `dotenv` files, which exist in encrypted form in
this repository.

```bash
# Clone the repo
$ git clone https://github.com/jnsgruk/infra
$ cd infra
# Decrypt secrets (follow prompts)
$ ./secrets.sh decrypt
# Login to the Github Packages Registry (where TOKEN.txt contains a valid Github access token)
$ cat ~/TOKEN.txt | docker login https://docker.pkg.github.com -u jnsgruk --password-stdin
# Create the infrastructure
$ docker-compose --env-file env/compose.env up -d
```

---

## Adapting for your own use

### Domain Config

Be sure to adjust any reference to `jnsgr.uk` to point to a domain that you control in the
[docker-compose.yml](./docker-compose.yml). You'll probably also want to comment out the section
that hosts my website...

### Env Files

If you are not me and do not have access to the encrypted `dotenv` files, the files should contain
the following variables as a minimum:

You can source all the variables in a given `.env` file like so:

```bash
export $(cat env/terraform.env | sed 's/#.*//g' | xargs)
```

### env/terraform.env

This file needs to specify two variables:

| Name              | Required | Notes                                                                               |
| :---------------- | :------: | :---------------------------------------------------------------------------------- |
| `TF_VAR_do_token` |   Yes    | A valid DigitalOcean API key                                                        |
| `ARM_ACCESS_KEY`  |   Yes    | Access Key for a valid Azure Blob Storage account for storing Terraform state files |

### env/compose.env

This file needs to specify two variables:

| Name    | Required | Notes                                                |
| :------ | :------: | :--------------------------------------------------- |
| `EMAIL` |   Yes    | Email address used when requesting LetsEncrypt certs |
