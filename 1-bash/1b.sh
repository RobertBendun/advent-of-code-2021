#!/usr/bin/env bash

lines="$(( $(wc -l "$1" | cut -sf1 -d ' ') - 2 ))"

at() {
	sed -n "$2,$(( $2 + 2 ))p" $1
}

count=0
prev="0"
for i in $(seq "$lines"); do
	if [ -z $i ]; then continue; fi
	current=$(( `( at "$1" "$i"; printf 0 ) | tr '\n' '+'` ))

	if [ "$prev" != "0" -a "$current" -gt "$prev" ]; then
		let "count++"
	fi
	prev=$current
done

echo "Answer is $count"
