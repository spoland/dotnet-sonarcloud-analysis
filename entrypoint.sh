#!/bin/sh -l

export PATH="$PATH:/root/.dotnet/tools"

# Begin analysis
dotnet sonarscanner begin /k:$1 /d:sonar.host.url=$2 /o:$3 /d:sonar.login=${SONAR_TOKEN} /d:sonar.cs.opencover.reportsPaths=$4

# Build & Test
dotnet build .
dotnet test . --collect:"XPlat Code Coverage" --settings coverlet.runsettings

# End analysis
dotnet sonarscanner end /d:sonar.login=${SONAR_TOKEN}
