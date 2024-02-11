#!/bin/bash

# Set hostname
sudo hostnamectl set-hostname nexus-server


# Install docker
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER
newgrp docker
sudo chmod 777 /var/run/docker.sock


# Run nexus container
docker run -d --name nexus -p 8081:8081 sonatype/nexus3