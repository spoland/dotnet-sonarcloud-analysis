# dotnet sonarscanner

This action uses the dotnet sonarscanner tool to scan a solution and collect coverage data. It was created with a specific use case in mind so version 1 has some requirements:

* The sln file must exist in the root of the repository.
* A [coverlet](https://github.com/coverlet-coverage/coverlet) settings file should exist in the root of the repository, setting the coverage report format to opencover.

```xml
<?xml version="1.0" encoding="utf-8"?>
<RunSettings>
  <DataCollectionRunSettings>
    <DataCollectors>
      <DataCollector friendlyName="XPlat code coverage">
        <Configuration>
          <Format>opencover</Format>
        </Configuration>
      </DataCollector>
    </DataCollectors>
  </DataCollectionRunSettings>
</RunSettings>
```

## Inputs

* `project-key` - Specifies the key of the analyzed project in SonarCloud.
* `sonar-organization` - Specifies the SonarCloud organization.
* `sonar-host-url` - Specifies the SonarCloud URL.
* `opencover-reports-paths` - Path to OpenCover coverage reports.

## Environment variables

* `SONAR_TOKEN` - An authorization token that can be created under the ['My Account'](https://sonarcloud.io/account/security) section of SonarCloud. Should be added as a secret and accessed as per the example.
* `GITHUB_TOKEN` - GitHub Token

## Example usage

``` yaml
  name: dotnet-sonarscanner
  uses: spoland/dotnet-sonarscanner@v1
  with:
    project-key: your-project-key
    sonar-host-url: https://sonarcloud.io
    sonar-organization: your-organization
    opencover-reports-paths: "**/*.opencover.xml"
  env:
    SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  ```
