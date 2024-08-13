#!/bin/bash
sudo apt update -y
sudo apt install -y docker.io

# Ensure the Docker service is running
sudo systemctl start docker
sudo systemctl enable docker

# Give the ubuntu user access to Docker (optional)
sudo usermod -aG docker ubuntu

# Pull the Docker image
docker pull nginx:latest

# Run the Docker container
docker run -d -p 82:80 --name my-nginx nginx:latest

# Log the output to a file for troubleshooting
docker ps -a | tee /tmp/docker-container-status.log
