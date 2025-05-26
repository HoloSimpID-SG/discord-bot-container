# Use the 24.04 Ubuntu LTS version for stability
FROM ubuntu:24.04

# Install common dependencies and clean up to reduce image size
RUN set -x \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -fy --no-install-recommends \
    git \
    ca-certificates \
    libc6 \
    libgcc-s1 \
    libicu74 \
    liblttng-ust1 \
    libssl3 \
    libstdc++6 \
    libunwind8 \
    zlib1g \
    git \
    dotnet-sdk-8.0 \
    aspnetcore-runtime-8.0 \
    dotnet-runtime-8.0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Define build arguments for repositories
ARG HOLOSIMP_IDSG_REMOTE=https://github.com/HoloSimpID-SG
ARG DISCORD_BOT_NET_REPO=${HOLOSIMP_IDSG_REMOTE}/HoloSimpCart-Net.git
ARG DISCORD_BOT_NET_REF=main

# Define folders
ARG WORK_DIR=/root/discord-bot
ARG NET_BOT_DIR=${WORK_DIR}/HoloSimpCart-Net

# Create the necessary directory, clone the connectedhomeip repo
RUN mkdir -p ${WORK_DIR} \
    && git clone ${DISCORD_BOT_NET_REPO} ${NET_BOT_DIR} --branch $DISCORD_BOT_NET_REF \
    && cd ${NET_BOT_DIR} \
    && git checkout $DISCORD_BOT_NET_REF \
    && git pull origin $DISCORD_BOT_NET_REF

# Copy sources into docker image
COPY src/run_discord_bot.sh ${NET_BOT_DIR}/run_discord_bot.sh
COPY src/.env ${NET_BOT_DIR}/.env
RUN chmod 755 ${NET_BOT_DIR}/run_discord_bot.sh
