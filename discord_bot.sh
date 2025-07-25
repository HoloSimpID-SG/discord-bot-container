#!/bin/bash

DESC="Discord Bot"
NAME="discord_bot"
SCRIPTNAME="$NAME.sh"

#
# Function that setups the discord_bot
#
setup_discord_bot() {
    echo "Setting up $NAME..."
    chmod u+x scripts/*
    chmod u+x scripts/setup/*
    ./scripts/bot_setup.sh $1 $2 $3 $4
    echo "Setting up $NAME done!"
}

#
# Function that starts the discord_bot
#
start_discord_bot() {
    echo "Starting $NAME..."
    ./scripts/bot_start.sh
    echo "Starting $NAME done!"
}

#
# Function that stops the discord_bot
#
stop_discord_bot() {
    echo "Stopping $NAME..."
    ./scripts/bot_stop.sh
    echo "Stopping $NAME done!"
}

#
# Function that shows the discord_bot status
#
status_of_discord_bot() {
    echo "Checking the status of $NAME..."
    ./scripts/bot_status.sh
    echo "Checking the status of $NAME done!"
}

case "$1" in
    setup)
        setup_discord_bot $2 $3 $4 $5
        ;;
    start)
        start_discord_bot
        ;;
    stop)
        stop_discord_bot
        ;;
    restart)
        stop_discord_bot
        start_discord_bot
        ;;
    status)
        status_of_discord_bot
        ;;
    *)
        echo "Usage: $SCRIPTNAME {setup <DISCORD_TOKEN> <GUILD_ID> <THREAD_ID> <SQL_CONNECTION>|start|stop|restart|status}"
        exit 1
        ;;
esac
