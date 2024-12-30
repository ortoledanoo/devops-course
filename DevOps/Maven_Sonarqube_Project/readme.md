
# Java Calculator with CI/CD Pipeline

This repository contains a Java Calculator application integrated with a CI/CD pipeline for efficient build, test, and deployment processes.

## Features

- **Maven Integration** - Handles dependency management and builds.
- **SonarQube** - Static code analysis for quality checks.
- **Artifactory** - Stores tested and approved build artifacts.
- **Docker Compose** - Run the container in easier way.

## Prerequisites

- Jenkins and Artifactory servers must be set up.
- SonarQube server with a valid token (`SONAR_TOKEN`).
- Docker and Docker-Compose installed.
- `.env` file containing environment variables -
  - `SONAR_TOKEN`
  - `SONAR_HOST_URL`
  - `ARTIFACTORY_TOKEN`
  - `ARTIFACTORY_URL`

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Build and run the application:
   ```bash
   docker-compose up --build
   ```
3. Ensure `.env` and `Dockerfile` are in the working directory.

## CI/CD Pipeline Overview

**Jenkins Pipeline**
   - SCM Checkout the code from GitLab.
   - Runs tests using SonarQube.
   - Builds the application using Maven.
   - Uploads the artifact to Artifactory.
   - Sends email notifications about the pipeline status.


