#!/bin/sh

set -e
set -u

if [ $# -lt 2 ]
then
	echo "failed: Some parameters were not specified."
	exit 1
else
	FILESDIR=$1
	SEARCHSTR=$2
	if [ ! -d "$FILESDIR" ]
	then
		echo "failed: ${FILESDIR} is not a directory."
		exit 1
	fi
	NUMFILES=$(find "$FILESDIR" -type f | wc -l)
	MATCHLINES=$(grep "$SEARCHSTR" "$FILESDIR" -r -o | wc -l)
fi

echo "The number of files are ${NUMFILES} and the number of matching lines are ${MATCHLINES}"
