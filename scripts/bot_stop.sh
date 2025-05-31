#!/bin/bash

cd docker
# Stop and remove everything (containers, networks, volumes)
docker compose down --volumes --remove-orphans
