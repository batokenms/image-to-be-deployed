#!/bin/bash

# Update packages and install security patches
sudo yum update -y

# Install Docker
sudo amazon-linux-extras install docker -y

# Start Docker daemon
sudo service docker start

# Enable Docker daemon to start at boot
sudo systemctl enable docker

# Add ec2-user to the docker group so you can execute Docker commands without using sudo
sudo usermod -a -G docker ec2-user

# Build the Docker image
docker build -t king-httpd-2 .

# Tag the image
docker tag king-httpd-2 josh1991/king-httpd-2

# Login to Docker Hub using environment variables
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Push the image to Docker Hub
docker push josh1991/king-httpd-2
