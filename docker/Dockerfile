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

# Define folders
ARG WORK_DIR=/root/discord-bot

# Create the necessary directory, clone the HoloSimpCart-Net repo
RUN mkdir -p ${WORK_DIR}/HoloSimpCart-Net

# Copy sources into docker image
COPY src/HoloSimpCart-Net ${WORK_DIR}/HoloSimpCart-Net
COPY src/compile_discord_bot.sh ${WORK_DIR}/compile_discord_bot.sh
COPY src/run_discord_bot.sh ${WORK_DIR}/run_discord_bot.sh
COPY src/.env ${WORK_DIR}/.env

# Compile sources
RUN cd ${WORK_DIR} \
    && chmod u+x run_discord_bot.sh \
    && chmod u+x compile_discord_bot.sh \
    && ./compile_discord_bot.sh

# Use exec form to forward signals properly
ENTRYPOINT ["/root/discord-bot/run_discord_bot.sh"]
