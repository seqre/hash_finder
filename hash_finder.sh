#!/usr/bin/env sh

if [[ $# -ne 1 ]]; then
	echo "Usage: hash_finder.sh MD5_HASH"
	exit 1
fi

hash=$1

for i in $(echo $PATH | sed 's/:/\n/g'); do
	find $i -type f -exec md5sum '{}' + | grep "^$hash"
done
