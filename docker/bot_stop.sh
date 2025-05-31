#!/bin/bash

docker stop --signal=SIGINT discord-bot-container
docker rm discord-bot-container
docker rmi discord-bot:common
