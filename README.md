# VEF-BIS-AIO

This project provides an easy way for deployment and maintenance of Virtual Economy Framework services (in containers) using Docker Compose.

Included services/containers:

- VEF-BlockchainIndexerService (The Virtual Economy Framework - Blockchain Indexer Service)
- VENFT-AppService (Another Virtual Economy Framework - App Service)
- Neblio (A Neblio node running nebliod)
- Kubo (An IPFS Implementation written in Go)
- VEF-BIS-Gateway (Nginx as reverse proxy)

This project also include files to CI/CD the last stable version of these Virtual Economy Framework componets in a community self-hosted Github Action Server.


## How to use this?

The following instructions are meant for direct installation in a Linux instance (PC, RPi, VPS/VM, Server) without a web server or reverse proxy (like Apache, Nginx and else) between the instance and public internet.

### 1. Clone the repository

### 2. Edit config files

### 3. Deploy the services

Run:
    docker-compose ...

## Testing the services

TODO.


# FAQ

1. A
2. B
3. C

More FAQs [here]{http://}.
