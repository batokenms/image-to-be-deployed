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
docker build -t nginx-content .

# Tag the image
docker tag nginx-content jeanp12/nginx-content:latest

# Set Docker Hub credentials as environment variables
# To set these environment variables on your terminal, you can run the following two commands, 
# replacing josh1956 with your Docker Hub username and Josh@12345 with your Docker Hub password:
# export DOCKER_USERNAME=jeanp12
# export DOCKER_PASSWORD=Kenms1210

# Login to Docker Hub while referencing to the value of the variable name by putting a dollar sign ($) in front
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Push the image to Docker Hub
docker push jeanp12/nginx-content:latest
