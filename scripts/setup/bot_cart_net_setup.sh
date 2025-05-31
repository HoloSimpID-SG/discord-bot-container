#!/bin/bash

# Define arguments for repositories
HOLOSIMP_IDSG_REMOTE=https://github.com/HoloSimpID-SG
DISCORD_BOT_NET_REPO=${HOLOSIMP_IDSG_REMOTE}/HoloSimpCart-Net.git
DISCORD_BOT_NET_REF=main

# Git clone HoloSimpCart-Net inside docker/src
cd docker/src
rm -rf HoloSimpCart-Net
git clone ${DISCORD_BOT_NET_REPO} HoloSimpCart-Net --branch $DISCORD_BOT_NET_REF
cd HoloSimpCart-Net
git checkout $DISCORD_BOT_NET_REF
git pull origin $DISCORD_BOT_NET_REF

cd ../../
