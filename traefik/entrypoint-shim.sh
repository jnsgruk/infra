#!/bin/sh
set -e
# Add `host.docker.internal` to the hosts file
ip -4 route list match 0/0 | awk '{print $3" host.docker.internal"}' >> /etc/hosts
# Run the original entrypoint in the container with all args passed to this script
/entrypoint.sh "$@"
