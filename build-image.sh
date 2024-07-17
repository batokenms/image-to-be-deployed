#!/bin/bash

# Update packages and install security patches
sudo apt-get update
sudo apt-get upgrade -y

# Install Docker
sudo apt-get install -y docker.io

# Start Docker daemon
sudo systemctl start docker

# Enable Docker daemon to start at boot
sudo systemctl enable docker

# Build the Docker image
docker build -t king-httpd .

# Tag the image
docker tag king-httpd josh1991/king-httpd

# Login to Docker Hub using environment variables
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Push the image to Docker Hub
docker push josh1991/king-httpd
