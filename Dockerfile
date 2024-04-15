FROM bellsoft/liberica-openjdk-alpine

# Install curl and jq in linux container
RUN apk add curl jq

RUN mkdir selenium-docker
WORKDIR /selenium-docker
ADD target/docker-resources ./
ADD healthcheck.sh   healthcheck.sh
ENTRYPOINT sh healthcheck.sh




