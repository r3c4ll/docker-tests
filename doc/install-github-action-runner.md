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


### Install Github Actions Runner

Go to your GitHub repository (the one for which you want to add the self-hosted runner). In the repository main page, go to the "Settings" tab and click on the dropdown menu "Actions" (in the left sidebar under the "Code and automation" section. Click on "Runners" and then on the green button "New self-hosted runner". And choose your operating system and architecture to follow the instructions that should be as follows (In a Linux x64):

#### Dowload

Create a folder

    mkdir actions-runner && cd actions-runner


Download the latest runner package

    curl -o actions-runner-linux-x64-2.304.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.304.0/actions-runner-linux-x64-2.304.0.tar.gz


Optional: Validate the hash

    echo "292e8770bdeafca135c2c06cd5426f9dda49a775568f45fcc25cc2b576afc12f  actions-runner-linux-x64-2.304.0.tar.gz" | shasum -a 256 -c


Extract the installer

    tar xzf ./actions-runner-linux-x64-2.304.0.tar.gz


#### Configure

Create the runner and start the configuration experience

    ./config.sh --url "https://github.com/YOUR_USERNAME/YOUR_GITHUB_REPOSITORY" --token "YOUR_RUNNER_RESISTRATION_TOKEN"


Last step, run it!

    ./run.sh


Be sure to replace YOUR_USERNAME, YOUR_GITHUB_REPOSITORY and YOUR_RUNNER_RESISTRATION_TOKEN with the proper values (In the line "./config.sh" is executed). The instructions on the Github website must shows the right values.


#### Using your self-hosted runner

    # Use this YAML in your workflow file for each job
    runs-on: self-hosted



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


Be sure to replace YOUR_USERNAME, YOUR_GITHUB_REPOSITORY and YOUR_RUNNER_RESISTRATION_TOKEN with the proper values (In the ./config.sh --url "https://github.com/YOUR_USERNAME/YOUR_GITHUB_REPOSITORY" --token "YOUR_RUNNER_RESISTRATION_TOKEN" line). Then save the script in a file (e.g install-github-actions-runner.sh) and execute it in the following way:

    bash install-github-actions-runner.sh



## Automatic (Ansible) procedure

Here is an Ansible playbook to do the same. (TODO: Need to fix the token generation issue)
