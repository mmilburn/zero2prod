#!/usr/bin/env bash
set -x
set -eo pipefail

DB_PORT="${POSTGRES_PORT:=5432}"
SUPERUSER="${SUPERUSER:=postgres}"
SUPERUSER_PWD="${SUPERUSER_PWD:=password}"

CONTAINER_NAME="postgres"
docker run \
  --env POSTGRES_USER=${SUPERUSER} \
  --env POSTGRES_PASSWORD=${SUPERUSER_PWD} \
  --publish "${DB_PORT}":5432 \
  --detach \
  --name "${CONTAINER_NAME}" \
  postgres -N 1000