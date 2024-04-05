#!/bin/sh

set -e
set -u

if [ $# -lt 2 ]
then
	echo "failed: Some parameters were not specified."
	exit 1
else
	WRITEFILE=$1
	WRITESTR=$2
	WDIR=${WRITEFILE%/*}
	WFILE=${WRITEFILE##*/}
	if [ ! -d "$WDIR" ]
	then
		mkdir -p "$WDIR"
		touch "$WRITEFILE"
		if [ ! -f "$WRITEFILE" ]
		then
			echo "failed: The file could not be created."
			exit 1
		fi
		echo "$WRITESTR" > "$WRITEFILE"
	else
		touch "$WRITEFILE"
		if [ ! -f "$WRITEFILE" ]
		then
			echo "failed: The file could not be created."
			exit 1
		fi
		echo "$WRITESTR" > "$WRITEFILE"
	fi
fi
