#!/bin/bash
# build_docker.sh
# Usage: ./build_docker.sh [image_name]

IMAGE_NAME=${1:-laravel-docker-app}

echo "Building Docker image: $IMAGE_NAME..."
docker build -t "$IMAGE_NAME" .
echo "Docker image built successfully!"
