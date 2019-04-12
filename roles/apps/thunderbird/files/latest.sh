#!/usr/bin/env bash

RELEASES_REPO="https://www.thunderbird.net/en-US/thunderbird/releases/"
VERSIONS=$(wget "$RELEASES_REPO" -qO- | grep -P -o -m 50 "(?<=releasenotes/\">)([^<]+)" | sort -r | head -n5 )

for VERSION in $VERSIONS; do
	URL="https://download.mozilla.org/?product=thunderbird-$VERSION-SSL&os=linux64&lang=en-US"
	if curl -f -I -L "$URL" &> /dev/null; then
		echo $URL
		exit 0
	fi
done

exit 1
