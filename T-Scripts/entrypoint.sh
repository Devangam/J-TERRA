#!/bin/bash
sudo apt update -y
sudo apt install -y docker.io
sudo chmod 666 /var/run/docker.sock
sudo systemctl start docker
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
sudo apt install maven -y
git clone https://github.com/Devangam/secretsanta-generator.git
cd secretsanta-generator
mvn package
docker build -t devangam/secretsanta-generator .
docker run -d -p 8080:8080 devangam/secretsanta-generator
