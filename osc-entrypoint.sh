#!/bin/sh

mkdir -p /tmp/health
python3 -m http.server 8080 --directory /tmp/health &

# Run the original entrypoint script
/usr/local/bin/docker-entrypoint.sh "$@"