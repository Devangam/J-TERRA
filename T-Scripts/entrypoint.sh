#!/bin/bash
sudo apt update -y | tee /tmp/apt-update.log
sudo apt install -y docker.io | tee /tmp/apt-install-docker.log
sudo chmod 666 /var/run/docker.sock | tee /tmp/docker-sock-permissions.log
sudo systemctl start docker | tee /tmp/docker-start.log
sudo usermod -aG docker ubuntu | tee /tmp/docker-usermod.log
sudo systemctl restart docker | tee /tmp/docker-restart.log
sleep 10
docker login -u devangam -p Dadslove@21
docker pull devangam/nginx
docker run -d -p 8081:8080 devangam/nginx | tee /tmp/docker-run.log
