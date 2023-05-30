#!/bin/bash

# Variables
YOUR_NON-ROOT_SYSTEM_USER=
YOUR_GITHUB_USERNAME=
YOUR_GITHUB_REPOSITORY=
YOUR_RUNNER_RESISTRATION_TOKEN=

# Update system
sudo apt update
sudo apt upgrade -y

# Install Docker
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $YOUR_NON-ROOT_SYSTEM_USER

# Verify Docker installation
sudo docker run hello-world

# Install Docker Compose
sudo apt install -y curl
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
docker-compose --version

# Install, setup and run GitHub Action Runner as a system service
mkdir -p actions-runner && cd actions-runner && sudo rm -r *
curl -O https://github.com/actions/runner/releases/download/v2.289.3/actions-runner-linux-x64-2.289.3.tar.gz
tar xzf actions-runner-linux-x64-2.289.3.tar.gz
./config.sh --url "https://github.com/$YOUR_GITHUB_USERNAME/$YOUR_GITHUB_REPOSITORY" --token "$YOUR_RUNNER_RESISTRATION_TOKEN"
sudo ./svc.sh install $YOUR_NON-ROOT_SYSTEM_USER
./svc.sh start
./svc.sh status
