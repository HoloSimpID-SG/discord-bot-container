#!/bin/bash

# Check if Docker exists
if ! command -v docker &> /dev/null; then
    echo "Docker not found, installing docker..."
    ./ubuntu_install_docker.sh
else
    echo "Docker is already installed."
fi

# Setting up bot environment variables
echo "Setting up bot environment variables..."
./scripts/bot_env_var_setup.sh $1 $2 $3 $4
