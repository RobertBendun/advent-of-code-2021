#!/usr/bin/env bash

prev=""
count=0
while read -r line; do
	if [ -z "$line" ]; then continue; fi

	if [ -z "$prev" ]; then
		prev="$line"
		continue
	fi

	if [ "$prev" -lt "$line" ]; then
		let "i++"
	fi
	prev="$line"
done

echo "Answer is $i"
