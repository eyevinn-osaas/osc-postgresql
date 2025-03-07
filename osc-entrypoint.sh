#!/bin/bash

mkdir -p /tmp/health
python3 -m http.server 8080 --directory /tmp/health &

if [[ ! -z "$POSTGRES_INITDB_SQL" ]]; then
  mkdir /docker-entrypoint-initdb.d/
  echo "$POSTGRES_INITDB_SQL" > /docker-entrypoint-initdb.d/init.sql
fi

# Run the original entrypoint script
/usr/local/bin/docker-entrypoint.sh "$@"
