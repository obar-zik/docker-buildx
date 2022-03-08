#!/bin/sh

set -ex

if [ -n "$(command -v "${1}")" ]; then
  exec "$@"
  exit "$?"
fi

echo Create Envierment
docker buildx create --use --name obMetoda --driver-opt network=host --use --buildkitd-flags '--allow-insecure-entitlement security.insecure --allow-insecure-entitlement network.host'
docker buildx inspect --bootstrap

echo docker hub login

if [ -n "$DOCKER_USERNAME" ] || [ -n "$DOCKER_PASSWORD" ]; then
  set +ex
  echo "logging into ${DOCKER_SERVER-Docker Hub}"
  echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin "$DOCKER_SERVER"
  set -ex
fi

echo Start Building
docker buildx build /app "$@"

if [ "${CLEAR_CACHE-true}" = "true" ]; then
  echo remove obMetoda
  docker buildx rm obMetoda
fi
