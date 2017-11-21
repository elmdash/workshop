#!/usr/bin/env bash

RELEASES_REPO="https://github.com/docker/compose/releases/latest"
LATEST=$(curl -s "$RELEASES_REPO" | grep -P -o "\d+\.\d+\.\d+")
PLATFORM=$(uname -s)
ARCH=$(uname -m)
URL="https://github.com/docker/compose/releases/download/$LATEST/docker-compose-$PLATFORM-$ARCH"

echo "$URL"
exit 0