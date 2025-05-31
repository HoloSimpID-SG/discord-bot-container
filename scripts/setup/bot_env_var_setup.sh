#!/bin/bash

# Template values
DEFAULT_TOKEN="your_discord_token"
DEFAULT_GUILD="your_guild_id"
DEFAULT_THREAD="your_thread_id"
DEFAULT_SQL="your_sql_connection_string_here"

# Assign variables with fallbacks
DISCORD_TOKEN="${1:-$DEFAULT_TOKEN}"
GUILD_ID="${2:-$DEFAULT_GUILD}"
THREAD_ID="${3:-$DEFAULT_THREAD}"
SQL_CONNECTION="${4:-$DEFAULT_SQL}"

# Rewrite .env file
echo "export DISCORD_TOKEN=$DISCORD_TOKEN" > docker/src/.env
echo "export GUILD_ID=$GUILD_ID" >> docker/src/.env
echo "export THREAD_ID=$THREAD_ID" >> docker/src/.env
echo "export SQL_CONNECTION=$SQL_CONNECTION" >> docker/src/.env
