#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Output green message prefixed with [+]
info() { echo -e "\e[92m[+] ${1:-}\e[0m"; }
# Output orange message prefixed with [-]
warning() { echo -e "\e[33m[-] ${1:-}\e[0m"; }
# Output red message prefixed with [!] and exit
error() { echo -e >&2 "\e[31m[!] ${1:-}\e[0m"; exit 1; }


main() {
  # Make sure sops is installed
  install_sops
  # Prompt user for Azure creds or read them from the environment
  login

  # Parse first argument to script
  if [[ "${1:-}" == "encrypt" ]]; then
    # If encrypt - then loop over the files we want to encrypt
    for i in nextcloud mariadb compose; do
      info "Encrypting env/$i.env => env/$i.enc.env"
      sops --encrypt --azure-kv "${SOPS_KEY_ID}" "${DIR}/env/${i}.env" > "${DIR}/env/${i}.enc.env"
    done
  elif [[ "${1:-}" == "decrypt" ]]; then
    # If decrypt - then loop over the files we want to encrypt
    for i in nextcloud mariadb compose; do
      info "Decrypting env/$i.enc.env => env/$i.env"
      sops --decrypt --azure-kv "${SOPS_KEY_ID}" "${DIR}/env/${i}.enc.env" > "${DIR}/env/${i}.env"
    done
  else
    error "Please specify either 'encrypt' or 'decrypt' as first argument"
  fi
  info "Done"
}

install_sops() {
  info "Checking for sops"
  # Check for sops in path
  if ! command -v sops >/dev/null; then
    warning "Sops binary not found"
    info "Checking latest version of sops"
    # Get the latest version from the Github release page
    SOPS_VERSION=$(curl -sNL https://github.com/mozilla/sops/tags | grep -m1 -Po '(?<=href="/mozilla/sops/releases/tag/v)[0-9]+\.[0-9]+\.[0-9]+')
    # Download the binary into /tmp for now
    info "Installing sops v${SOPS_VERSION} to /usr/local/bin/sops"
    curl -Lo /tmp/sops "https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux"
    # Install the binary to /usr/local/bin and set permissions
    sudo mkdir -p /usr/local/bin
    sudo mv /tmp/sops /usr/local/bin/sops
    sudo chmod +x /usr/local/bin/sops
  fi
  info "Sops installed"
}

login() {
  # Check if the environment is already set, otherwise prompt user for Azure creds
  if [[ -z "${AZURE_TENANT_ID:-}" ]]; then
    read -r -p "Enter Azure Tenant ID: " AZURE_TENANT_ID
    read -r -p "Enter Azure Client ID: " AZURE_CLIENT_ID
    read -r -p "Enter Azure Client Secret: " AZURE_CLIENT_SECRET
    # Export them so sops can read them
    export AZURE_TENANT_ID 
    export AZURE_CLIENT_ID 
    export AZURE_CLIENT_SECRET
  fi

  # Check if the key id has been set - otherwise prompt and export
  if [[ -z "${SOPS_KEY_ID:-}" ]]; then
    read -r -p "Enter Azure Key Vault Key ID: " SOPS_KEY_ID
    export SOPS_KEY_ID
  fi
}

main "$@"