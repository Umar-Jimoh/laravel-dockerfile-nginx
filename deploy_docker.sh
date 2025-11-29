#!/bin/bash
# deploy_docker.sh
# Usage: ./deploy_docker.sh [image_name] [port]

IMAGE_NAME=${1:-laravel-docker-app}
PORT=${2:-8080}

echo "Running Docker container from image $IMAGE_NAME on port $PORT..."
docker run -d -p "$PORT":80 "$IMAGE_NAME"
echo "App should be accessible at http://localhost:$PORT"
