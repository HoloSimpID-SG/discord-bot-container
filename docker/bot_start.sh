#!/bin/bash

docker buildx build --file Dockerfile --tag discord-bot:common --load .
docker run -d --name discord-bot-container --stop-signal SIGINT discord-bot:common
