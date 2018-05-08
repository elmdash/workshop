#!/usr/bin/env bash

RELEASES_REPO="https://github.com/kubernetes/minikube/releases/latest"
LATEST=$(curl -s "$RELEASES_REPO" | grep -P -o "\d+\.\d+\.\d+")
PLATFORM=$(uname -s)
ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    ARCH="amd64"
fi

URL="https://github.com/kubernetes/minikube/releases/download/v$LATEST/minikube-$PLATFORM-$ARCH"

echo "$URL"
exit 0