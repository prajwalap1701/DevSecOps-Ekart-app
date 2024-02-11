#!/bin/bash

# Set hostname
sudo hostnamectl set-hostname sonarqube-server

# Install docker
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER
newgrp docker
sudo chmod 777 /var/run/docker.sock


# Run sonarcube container
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community