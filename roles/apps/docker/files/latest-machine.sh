#!/usr/bin/env bash

RELEASES_REPO="https://github.com/docker/machine/releases/latest"
LATEST=$(curl -s "$RELEASES_REPO" | grep -P -o "\d+\.\d+\.\d+")
PLATFORM=$(uname -s)
ARCH=$(uname -m)
URL="https://github.com/docker/machine/releases/download/v$LATEST/docker-machine-$PLATFORM-$ARCH"

echo "$URL"
exit 0