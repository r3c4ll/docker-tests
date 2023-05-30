# Installing Docker, Docker Compose, and GitHub Actions Runner

These procedures are for Debian GNU/Linux 11 (Bullseye). Must work for any other Debian based distribution like Ubuntu just finding (and changing the commands) the right GPG key and Docker repository URL for your distribution.


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


Allowing a non-root user to use the docker daemon (replace YOUR_NON-ROOT_SYSTEM_USER by your non-root user):

    sudo usermod -aG docker YOUR_NON-ROOT_SYSTEM_USER


Verify that Docker is installed and running:

    docker run hello-world


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

Create a folder:

    mkdir actions-runner && cd actions-runner


Download the latest runner package:

    curl -o actions-runner-linux-x64-2.304.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.304.0/actions-runner-linux-x64-2.304.0.tar.gz


(Optional) Validate the hash:

    echo "292e8770bdeafca135c2c06cd5426f9dda49a775568f45fcc25cc2b576afc12f  actions-runner-linux-x64-2.304.0.tar.gz" | shasum -a 256 -c


Extract the installer:

    tar xzf ./actions-runner-linux-x64-2.304.0.tar.gz


#### Configure

Create the runner and start the configuration experience:

    ./config.sh --url "https://github.com/YOUR_USERNAME/YOUR_GITHUB_REPOSITORY" --token "YOUR_RUNNER_RESISTRATION_TOKEN"


Be sure to replace YOUR_USERNAME, YOUR_GITHUB_REPOSITORY and YOUR_RUNNER_RESISTRATION_TOKEN with the proper values (In the line "./config.sh" is executed). The instructions on the Github website must shows the right values.

Install the service (replace YOUR_NON-ROOT_SYSTEM_USER for the username registered in the system that you want to run the service):

    sudo ./svc.sh install YOUR_NON-ROOT_SYSTEM_USER


Start the runner service:

    ./svc.sh start


Check the status of the service:

    ./svc.sh status


#### Using your self-hosted runner

Use this YAML in your workflow files for each job that you want to be runned by your runner self-hosted server:

    runs-on: self-hosted



## Automatic (Bash script) procedure

[Here](../resources/bash/install-github-actions-runner.sh) is a Bash script to accomplish the same tasks.

Just be sure to edit it replacing YOUR_USERNAME, YOUR_GITHUB_REPOSITORY, YOUR_RUNNER_RESISTRATION_TOKEN and YOUR_NON-ROOT_SYSTEM_USER with the proper values.

Then execute the script making it executable or in the following way:

    bash install-github-actions-runner.sh



## Automatic (Ansible) procedure

You can find Ansible playbooks to accoumplish these tasks [here](../resources/ansible).

Download the files and edit the config files replaceing the proper values.

Run the install-github-actions-runner.yml playbook:

    ansible-playbook -u YOUR_NON-ROOT_SYSTEM_USER install-github-actions-runner.yml --ask-become-pass --extra-vars "@github-action-runner-config.yml"


Run the install-docker-and-docker-compose.yml playbook:

    ansible-playbook -u YOUR_NON-ROOT_SYSTEM_USER install-docker-and-docker-compose.yml --ask-become-pass --extra-vars "@docker-config.yml"

