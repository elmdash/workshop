#!/usr/bin/env bash

RELEASES_REPO="https://www.jetbrains.com/intellij-repository/releases"
RELEASE_URL="https://www.jetbrains.com/intellij-repository/releases/com/jetbrains/intellij/idea/BUILD/"
VERSIONS=$(wget "$RELEASES_REPO" -qO- | grep -P -o -m 5 "(?<=$RELEASE_URL)[^/]+(?=/)")

for VERSION in $VERSIONS; do
	URL="https://download.jetbrains.com/idea/ideaIU-$VERSION.tar.gz"
	if curl -f -I -L "$URL" &> /dev/null; then
		echo $URL
		exit 0
	fi
done

exit 1
