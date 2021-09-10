#!/bin/bash

# Remove old packages
sudo apt-get -y remove docker docker-engine docker.io containerd runc
sudo rm $(which docker-machine)
sudo rm $(which docker-compose)

# Install Docker Engine
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

# Add current user in docker group
sudo usermod -aG docker $USER

# Install Docker Machine
# Versions: https://github.com/docker/machine/releases
version=0.16.2 && sudo curl -L https://github.com/docker/machine/releases/download/v$version/docker-machine-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-machine && sudo chmod +x /usr/local/bin/docker-machine

# Install Docker Compose
# Versions: https://github.com/docker/compose/releases
version=1.29.2 && sudo curl -L https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose
