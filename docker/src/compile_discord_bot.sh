#!/bin/bash

ARCH=$(uname -m)

case "$ARCH" in
    x86_64)
        RID="linux-x64"
        ;;
    aarch64)
        RID="linux-arm64"
        ;;
    armv7l)
        RID="linux-arm"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

echo "Using RID: $RID"

cd HoloSimpCart-Net

echo "Compiling dotnet project"
dotnet publish -c Release -r $RID --self-contained true -p:PublishSingleFile=true

echo "Move compile result to working directory"
cp bin/Release/net8.0/$RID/publish/RuTakingTooLong ~/discord-bot/discord-bot

echo "Add execute permission to bot"
chmod u+x ~/discord-bot/discord-bot
