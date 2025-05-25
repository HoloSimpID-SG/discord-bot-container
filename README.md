# discord-bot-container
Deploy Discord Bot on Ubuntu Environment in Docker Container

## Prerequisites

### OS
This scripts are running on Ubuntu Environment

### Ubuntu Docker Installation
To install Docker on Ubuntu platform, please run `ubuntu_install_docker.sh`

### Setup Discord Token and Guild ID
Please update the file located at `docker/src/.env` by adding in your existing Discord Token and Guild ID 

## Start Discord Bot
To start bot, run `docker/bot_start.sh`

## Stop Discord Bot
To stop bot, run `docker/bot_stop.sh`
