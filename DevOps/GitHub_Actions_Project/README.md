# CI/CD Pipeline for Simple Java Maven App

This project demonstrates a CI/CD pipeline for a simple Java Maven application using GitHub Actions. The pipeline automates versioning, Docker image creation, and deployment.

## Features

1. **Version Management**: Automatically increments the patch version of the JAR file (starting at 1.0.0).
2. **Docker Integration**: Builds and pushes a multi-stage Docker image to a container registry.
3. **Deployment**: Deploys the application using Docker Compose on a remote server via SSH.

## Steps to Run the Pipeline

1. **Fork the Repository** - [Simple Java Maven App](https://github.com/jenkins-docs/simple-java-maven-app).
2. **Set Up Repository Secrets**:
   - `DOCKER_USERNAME` and `DOCKER_PASSWORD` for Docker Hub.
   - `AWS_ACCESS_ID` and `AWS_ACCESS_KEY` for AWS User.
   - `AWS_SG_ID` for the AWS security group ID.
   - `AWS_EC2_ID` for the target EC2 instance ID.
   - `SSH_PRIVATE_KEY` for SSH access to the deployment server.

3. **Pipeline Workflow**:
   - **Version Update** - Updates the Maven project version using `mvn release:update-versions` Plugin.
   - **Docker Build** - Builds and pushes the Docker image to Docker Hub.
   - **Deployment** - Deploys the application using Docker Compose on a remote server and SSH Connection.

## How to Trigger the Pipeline

- Push changes to the `master` branch to start the pipeline.

## Prerequisites

- Java 17 or higher.
- Docker and Docke-Compose installed on the deployment server.
- AWS CLI configured with the right permissions as bellow.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupIngress"
            ],
            "Resource": "*"
        }
    ]
}
```
