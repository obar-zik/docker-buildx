FROM docker:20.10

COPY --from=docker/buildx-bin:v0.7 /buildx /usr/libexec/docker/cli-plugins/docker-buildx

COPY ./setup.sh /home/setup.sh

ENTRYPOINT [ "/home/setup.sh" ]