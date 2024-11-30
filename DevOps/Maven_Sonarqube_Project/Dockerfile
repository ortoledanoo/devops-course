# Stage 1: Maven build and analyze
FROM maven:3.8-openjdk-17 AS builder

WORKDIR /app
COPY . .

ARG SONAR_TOKEN
ARG SONAR_HOST_URL

RUN mvn clean verify sonar:sonar \
    -DskipTests \
    -Dsonar.projectKey=ortoledano_calculator_560f9a32-286c-4730-97e5-6e8c230c3244 \
    -Dsonar.projectName=Calculator \
    -Dsonar.host.url=${SONAR_HOST_URL} \
    -Dsonar.token=${SONAR_TOKEN} \
    && mvn clean package -DskipTests

# Stage 2: JFrog CLI for Artifactory upload
FROM releases-docker.jfrog.io/jfrog/jfrog-cli-v2 AS artifactory

WORKDIR /app
COPY --from=builder /app/target/Calculator-1.0-SNAPSHOT.jar .

ARG ARTIFACTORY_TOKEN
ARG ARTIFACTORY_URL

RUN jfrog rt upload \
    --url ${ARTIFACTORY_URL} \
    --access-token ${ARTIFACTORY_TOKEN} \
    Calculator-1.0-SNAPSHOT.jar \
    calculator-app-repo/

