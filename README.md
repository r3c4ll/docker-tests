# docker-tests
Just a test for CI/CD with Docker in Github 

## Preparing the self-hosted Github Action Server

Go to https://github.com/r3c4ll/docker-tests/settings/actions/runners/new and follow the instructions.
Basically:

    # Downloading and configuring the runner software
    mkdir actions-runner && cd actions-runner
    curl -o actions-runner-linux-x64-2.304.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.304.0/actions-runner-linux-x64-2.304.0.tar.gz
    tar xzf ./actions-runner-linux-x64-2.304.0.tar.gz
    ./config.sh --url https://github.com/r3c4ll/docker-tests --token AACUPOMPZ2Z7IULJU5SLSPDENAQLE

    # Stetting up and starting it as a (systemd) service
    sudo ./svc.sh install
    sudo ./svc.sh start

Use this YAML in your workflow file for each job
runs-on: [self-hosted, linux, X64, docker]
