#Installing Docker, Docker Compose, and GitHub Actions Runner

This steps are for Debian GNU/Linux 11 (Bullseye)

## Install Docker

1. Update the package lists:

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
