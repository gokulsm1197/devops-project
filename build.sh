#!/bin/bash
IMAGE_NAME="my-web-app"
DOCKERFILE_PATH="./path/to/Dockerfile"
docker build -t "$IMAGE_NAME" "$DOCKERFILE_PATH"