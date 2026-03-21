#!/bin/bash

# Stop script if any command fails
set -e

echo "Building Docker image..."
docker build -t cv-webapp .

echo "Running Docker container..."
docker run -d --name cv-webapp -p 8080:80 cv-webapp

echo "Docker container running on http://localhost:5002"