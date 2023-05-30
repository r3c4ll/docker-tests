# Installing Docker, Docker Compose, and GitHub Actions Runner

These procedures are for Debian GNU/Linux 11 (Bullseye).


## Manual procedure


### Install Docker

Update the package lists:

    sudo apt update


Install necessary packages to allow apt to use a repository over HTTPS:

    sudo apt install apt-transport-https ca-certificates curl software-properties-common


Add Docker's official GPG key:

    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


Add Docker's repository:

    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


Update the package lists again:

    sudo apt update


Install Docker:

    sudo apt install docker-ce docker-ce-cli containerd.io


Verify that Docker is installed and running:

    sudo docker run hello-world


### Install Docker Compose

Download the Docker Compose binary:

    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


Apply executable permissions to the binary:

    sudo chmod +x /usr/local/bin/docker-compose


Verify that Docker Compose is installed:

    docker-compose --version



## Automatic (Bash script) procedure

Here is a Bash script to accomplish the tasks.


    #!/bin/bash

    # Update system
    sudo apt update
    sudo apt upgrade -y

    # Install Docker
    sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER

    # Install Docker Compose
    sudo apt install -y curl
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    # Verify Docker Compose installation
    docker-compose --version

    # Install, setup and run GitHub Action Runner
    mkdir actions-runner && cd actions-runner
    curl -O https://github.com/actions/runner/releases/download/v2.289.3/actions-runner-linux-x64-2.289.3.tar.gz
    tar xzf actions-runner-linux-x64-2.289.3.tar.gz
    ./config.sh --url "https://github.com/YOUR_USERNAME/YOUR_GITHUB_REPOSITORY" --token "YOUR_RUNNER_RESISTRATION_TOKEN"
    ./run.sh &



## Automatic (Ansible) procedure

Here is an Ansible playbook to do the same.
