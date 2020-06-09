FROM mcr.microsoft.com/dotnet/core/sdk AS build

# Add tools directory to the PATH environment variable.
ENV PATH="${PATH}:/root/.dotnet/tools"

# Copy script to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Install dotnet-sonarscanner globally
RUN apt-get update && apt-get install default-jre-headless -y
RUN dotnet tool install --global dotnet-sonarscanner

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
