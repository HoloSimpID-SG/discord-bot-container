#!/bin/bash

cd docker
# Rebuild from scratch (ignore cache) and start
docker compose build --no-cache
docker compose up -d
