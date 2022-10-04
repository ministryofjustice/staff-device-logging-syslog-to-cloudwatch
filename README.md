[![repo standards badge](https://img.shields.io/badge/dynamic/json?color=blue&style=flat&logo=github&labelColor=32393F&label=MoJ%20Compliant&query=%24.result&url=https%3A%2F%2Foperations-engineering-reports.cloud-platform.service.justice.gov.uk%2Fapi%2Fv1%2Fcompliant_public_repositories%2Fstaff-device-logging-syslog-to-cloudwatch)](https://operations-engineering-reports.cloud-platform.service.justice.gov.uk/public-github-repositories.html#staff-device-logging-syslog-to-cloudwatch "Link to report")

# Vector Syslog to CloudWatch

## Introduction

This repository contains the code for the containerised application to send Syslog messages to CloudWatch.
Once the messages are in CloudWatch, they will be picked up and shipped to the OST platform. [Vector](https://vector.dev/) was selected as it is a popular open source solution for getting syslogs into CloudWatch.

It currently listens on `UDP` on the default port `514` for any incoming messages.

This container is run in a set AWS ECS tasks.

## Getting Started

To boot this application locally, run `make run`

Configuring Vector is done in the [vector.toml](./docker/vector.toml) file.

When running this locally, [vector.development.toml](./docker/vector.development.toml) will be used.
New features should be created as a pull request in Github.


## Deploying

This application is deployed through AWS CodePipeline. There are 3 environments that this service runs on:

- Development
- Pre-Production
- Production

Any changes merged into the `main` branch will be deployed to Development and Pre-Production.
Manual approval is required to deploy to Production.

Deploying on CI is a 2 step process:

1. Build and push the Docker image to AWS ECR
2. Create a new zero downtime ECS deployment

More details can be found in [./scripts/deploy](./scripts/deploy)
