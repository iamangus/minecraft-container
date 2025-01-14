#
# Minecraft server (Vanilla) Dockerfile
# https://github.com/dtp/docker-minecraft
#

ARG JRE_VER="17"

# Pull base image
FROM eclipse-temurin:${JRE_VER}-jre-alpine

# Install dependencies
RUN apk add --no-cache bash curl

# create user
RUN addgroup -S mcgrp && adduser -S mcusr -G mcgrp

# Tell docker that all future commands should run as the minecraft user
USER mcusr

# Define working directory
WORKDIR /home/mcusr

# Define entry point
ENTRYPOINT bash /home/mcusr/entrypoint.sh

# Expose server and RCON ports
EXPOSE 25565 25575