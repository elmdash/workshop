#!/usr/bin/env bash

VERSION=$(wget "https://www.jetbrains.com/intellij-repository/releases" -qO- | grep -P -o -m 1 "(?<=https://www.jetbrains.com/intellij-repository/releases/com/jetbrains/intellij/idea/BUILD/)[^/]+(?=/)")
echo "https://download.jetbrains.com/idea/ideaIU-$VERSION.tar.gz"