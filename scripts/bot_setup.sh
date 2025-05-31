#!/bin/bash

# Check if Docker exists
if ! command -v docker &> /dev/null; then
    echo "Docker not found, installing docker..."
    exec ./ubuntu_install_docker.sh
else
    echo "Docker is already installed."
fi

# Setting up environment variables
exec ./bot_env_var_setup.sh $1 $2 $3 $4
