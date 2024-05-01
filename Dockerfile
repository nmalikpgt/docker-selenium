FROM bellsoft/liberica-openjdk-alpine
# Instal curl and jq in linux container
RUN apk add curl jq
RUN apk add --no-cache --upgrade bash

RUN mkdir selenium-docker
WORKDIR /selenium-docker
ADD target/docker-resources ./
ADD healthcheck.sh   healthcheck.sh
ENTRYPOINT sh healthcheck.sh




