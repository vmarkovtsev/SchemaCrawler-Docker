#!/bin/bash

# ## DOCKER
echo "Creating SchemaCrawler Docker container"

# Print Docker version
pwd
docker version  

# Build Docker image
docker build -t schemacrawler/schemacrawler .
docker tag schemacrawler/schemacrawler schemacrawler/schemacrawler:v15.03.02 
docker tag schemacrawler/schemacrawler schemacrawler/schemacrawler:latest

# Deploy image to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push schemacrawler/schemacrawler
docker logout  

# Remove local image
# docker rm schemacrawler/schemacrawler
