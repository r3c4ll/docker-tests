# VEF Docker Lab

Just a test for CI/CD the Virtual Economy Framework with Docker in Github 


## Goal

The main idea here is to execute three docker containers (One for the VirtualEconomyFramework App Service, another for Neblio and the last one for IPFS).


## Preparing the self-hosted Github Action Server

Go to https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners and follow the instructions.

Basically (we can put this in a shell script):

    # Downloading and configuring the runner software
    mkdir actions-runner && cd actions-runner
    curl -o actions-runner-linux-x64-2.304.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.304.0/actions-runner-linux-x64-2.304.0.tar.gz
    tar xzf ./actions-runner-linux-x64-2.304.0.tar.gz
    ./config.sh --url https://github.com/r3c4ll/docker-tests --token AACUPOMPZ2Z7IULJU5SLSPDENAQLE

    # Stetting up and starting it as a (systemd) service
    sudo ./svc.sh install
    sudo ./svc.sh start

Then use this on the YAML of your workflow file for each job:

    runs-on: [self-hosted, linux, X64, docker]


## Testing the services

TODO.
