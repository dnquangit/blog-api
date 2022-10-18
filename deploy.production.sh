#!/bin/sh

APP_NAME=blog-api
DOCKER_FILE=./deploy.production.dockerfile

echo "Delete old image ..."
docker rmi -f ${APP_NAME}

echo "Docker build image ..."
docker build -t ${APP_NAME} -f ${DOCKER_FILE} .