#!/bin/bash

source .env

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

dotnet publish -c Release -r $RID --self-contained true -p:PublishSingleFile=true

chmod u+x bin/Release/net8.0/$RID/publish/RuTakingTooLong
./bin/Release/net8.0/$RID/publish/RuTakingTooLong
