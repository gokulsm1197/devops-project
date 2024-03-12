#!/bin/bash
REMOTE_SERVER="user@your_server_ip"
IMAGE_NAME="my-web-app"
CONTAINER_NAME="my-web-container"
DOCKER_COMPOSE_FILE="docker-compose.yml"
echo "Transferring Docker image to server..."
docker save "$IMAGE_NAME" | ssh "$REMOTE_SERVER" docker load
echo "SSH into server..."
ssh "$REMOTE_SERVER" << EOF


# Pull Docker image
echo "Pulling Docker image..."
docker pull "$IMAGE_NAME"

# Stop and remove existing container if exists
echo "Stopping and removing existing container..."
docker stop "$CONTAINER_NAME" || true
docker rm "$CONTAINER_NAME" || true

# Run new container
echo "Starting new container..."
docker run -d --name "$CONTAINER_NAME" -p 8080:80 "$IMAGE_NAME"

# If using docker-compose
# echo "Starting Docker services with docker-compose..."
# docker-compose -f "$DOCKER_COMPOSE_FILE" up -d

EOF

echo "Deployment complete."