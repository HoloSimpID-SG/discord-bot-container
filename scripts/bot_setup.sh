#!/bin/bash

# Check if Docker exists
if ! command -v docker &> /dev/null; then
    echo "Docker not found, installing docker..."
    exec ./ubuntu_install_docker.sh
else
    echo "Docker is already installed."
fi
