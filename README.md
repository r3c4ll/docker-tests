# VEF-BIS-AIO

This project provides an easy way for deployment and maintenance of Virtual Economy Framework services (through Docker containers) using Docker Compose.

Included services/containers:

- VEF-BlockchainIndexerService (The Virtual Economy Framework - Blockchain Indexer Service)
- VENFT-AppService (Another Virtual Economy Framework - App Service)
- Neblio (A Neblio node running nebliod)
- Kubo (An IPFS Implementation written in Go)
- BIS-Gateway (Nginx as reverse proxy)


## Diagram of components and connections

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/25423296/163456776-7f95b81a-f1ed-45f7-b7ab-8fa810d529fa.png">
  <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
</picture>


## Demo Server

This project also include files to CI/CD the last stable version of these Virtual Economy Framework componets in a community self-hosted Github Action Runner for demostration purposes (see [workflows](.github/workflows))

You can access the demo [here](http://demo.server.url)


## How to use this?

The following instructions are meant for direct installation in a Linux instance (PC, RPi, VPS/VM, Server) without a web server or reverse proxy (like Apache, Nginx and else) between the instance and public internet.

Login (locally or via ssh) to the Linux machine where you want to run the services (it needs [Docker] and [Docker Compose] installed), and follow the next steps:


### 1. Clone the repository

Run:

    git clone 


### 2. Edit config files

Run:

    nano


### 3. Run the services

Run:

    docker-compose up -d


## Testing the services

TODO.


# FAQ

1. A
2. B
3. C

More FAQs [here](docs/faqs.md).