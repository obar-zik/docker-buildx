# obarzik/buildx

run docker buildx without the need to install buildx on your system.

## Usage

```bash
  docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /path/to/dockerfile:/app
    obarzik/buildx:latest
```

### Options

DOCKER_USERNAME - docker hub username
DOCKER_PASSWORD - docker hub password
DOCKER_SERVER - custom docker server
CLEAR_CACHE(default: true) - delete docker buildx container

### Example

```bash
docker run \
  --rm \
  -e DOCKER_PASSWORD="$DOCKER_PASSWORD" \
  -e DOCKER_USERNAME="obarzik" \
  -e CLEAR_CACHE="false" \
  -v $PWD:/app \
  -v /var/run/docker.sock:/var/run/docker.sock \
  obarzik/buildx:latest \
  --platform linux/amd64,linux/arm64 \
  --network=host \
  -t "obarzik/my-image" \
  --push
```
