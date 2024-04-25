FROM bellsoft/liberica-openjdk-alpine

# Install curl and jq in linux container
RUN apk --no-cache add curl

RUN mkdir selenium-docker
WORKDIR /selenium-docker
ADD target/docker-resources ./
ADD healthcheck.sh   healthcheck.sh
ENTRYPOINT sh healthcheck.sh




