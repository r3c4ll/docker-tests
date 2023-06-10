FROM debian:bullseye
MAINTAINER Ali Moreno <alimoreno@gmail.com>

# Updating the base system and installing basic tools
RUN apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
    ca-certificates \
    wget \
    git

# Install dependencies (.NET)
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && apt-get install -y dotnet-sdk-7.0 && \
    dotnet --info

# Clone the 182-blockchain-indexer branch of the VEF repository
RUN mkdir -p ~/vef && cd ~/vef && \
    git clone -b 182-blockchain-indexer --single-branch \
    https://github.com/fyziktom/VirtualEconomyFramework.git

# Publishing the DLL
RUN cd ~/vef/VirtualEconomyFramework/VirtualEconomyFramework/VEFramework.BlockchainIndexerServer/ && \
    dotnet publish --configuration Release --output ./publish

# Run the service CMD ["dotnet ./publish/VEFramework.BlockchainIndexerServer.dll"]
#CMD ["dotnet ./publish/VEFramework.BlockchainIndexerServer.dll"]
