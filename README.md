# Personal Infrastructure

This repo contains the Infrastructure-as-Code that creates my personal infrastructure using `docker-compose`. It currently manages:

- [traefik](https://traefik.io)
- [nextcloud](https://nextcloud.com/) (backed by mariadb & redis)
- [onlyoffice](https://hub.docker.com/r/onlyoffice/documentserver/)
- [bin](https://github.com/w4/bin)
- [jnsgr.uk](https://github.com/jnsgruk/jnsgr.uk)
- [watchtower](https://github.com/containrrr/watchtower)

Traefik is configured to redirect all domains to `HTTPS`, and all certs are automatically issued from LetsEncrypt (provided the relevant DNS records are in place).

Secrets are managed using `dotenv` files encrypted with [sops](https://github.com/mozilla/sops).

## Getting Started

The `docker-compose` file relies upon a number of `dotenv` files, which exist in encrypted form in this repository.

```bash
# Clone the repo
$ git clone https://github.com/jnsgruk/infra
$ cd infra
# Decrypt secrets (follow prompts)
$ ./secrets.sh decrypt
# Login to the Github Packages Registry (where TOKEN.txt contains a valid Github access token)
$ cat ~/TOKEN.txt | docker login https://docker.pkg.github.com -u jnsgruk --password-stdin
# Create the infrastructure
$ docker-compose --env-file env/compose.yml up -d
```

---

## Adapting for your own use

### Domain Config

Be sure to adjust any reference to `jnsgr.uk` to point to a domain that you control in the [docker-compose.yml](./docker-compose.yml). You'll probably also want to comment out the section that hosts my website...

### Env Files

If you are not me and do not have access to the encrypted `dotenv` files, the files should contain the following variables as a minimum:

### env/compose.env

This file needs to specify two variables:

| Name                  | Data Type | Required | Notes                                                                          |
| :-------------------- | :-------: | :------: | :----------------------------------------------------------------------------- |
| `EMAIL`               | `string`  |   Yes    | Email address used when requesting LetsEncrypt certs                           |
| `ADMIN_USER`          | `string`  |   Yes    | Format is `username:pw_hash`, generated with: `htpasswd -nb username password` |
| `REDIS_HOST_PASSWORD` | `string`  |   Yes    | Password for Redis instance that backs Nextcloud for file locking              |

### env/nextcloud.env

Where variables are not required here, it is usually because the values can be configured in the first setup wizard for Nextcloud.

| Name                        | Data Type | Required | Notes                                                                                                       |
| :-------------------------- | :-------: | :------: | :---------------------------------------------------------------------------------------------------------- |
| `NEXTCLOUD_ADMIN_USER`      | `string`  |    No    | Admin username for Nextcloud instance                                                                       |
| `NEXTCLOUD_ADMIN_PASSWORD`  | `string`  |    No    | Admin password for Nextcloud instance                                                                       |
| `NEXTCLOUD_TRUSTED_DOMAINS` | `string`  |    No    | Space separated list of domains for Nextcloud to trust. Set this to the domain name you're deploying to     |
| `TRUSTED_PROXIES`           | `string`  |   Yes    | Set this to `traefik` in most instances                                                                     |
| `OVERWRITE_PROTOCOL`        | `string`  |    No    | Set this to `https` in most instances                                                                       |
| `OVERWRITE_HOST`            | `string`  |    No    | Set this to the deployment domain in most instances                                                         |
| `MYSQL_HOST`                | `string`  |    No    | Set this to `nextcloud-db` in most instance, unless deploying your database by another means than this repo |
| `MYSQL_USER`                | `string`  |    No    | Username to connect to MariaDB with                                                                         |
| `MYSQL_PASSWORD`            | `string`  |    No    | Password to connect to MariaDB with                                                                         |
| `MYSQL_DATABASE`            | `string`  |    No    | Name of database to connect to                                                                              |
| `REDIS_HOST`                | `string`  |   Yes    | Set this to `nextcloud-redis` unless deploying Redis elsewhere                                              |
| `REDIS_HOST_PORT`           | `string`  |   Yes    | Set this to `6379` unless deploying Redis elsewhere                                                         |
| `REDIS_HOST_PASSWORD`       | `string`  |   Yes    | Password for Redis instance, specified in `env/compose.env`                                                 |

### env/mariadb.env

| Name                  | Data Type | Required | Notes                                              |
| :-------------------- | :-------: | :------: | :------------------------------------------------- |
| `MYSQL_ROOT_PASSWORD` | `string`  |   Yes    | Set to desired root password for MariaDB           |
| `MYSQL_USER`          | `string`  |   Yes    | Set to desired username to connect to MariaDB with |
| `MYSQL_PASSWORD`      | `string`  |   Yes    | Set to desired password to connect to MariaDB with |
| `MYSQL_DATABASE`      | `string`  |   Yes    | Name of database to create                         |
