#!/bin/sh


DOCKER_PGP_FILE=/usr/share/keyrings/docker-archive-keyring.gpg
if [ ! -f "$DOCKER_PGP_FILE" ]; then
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o $DOCKER_PGP_FILE
fi


curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
