#!/bin/sh

mv $1 $1.old

sed -E -e 's/(->|,)/ /g' -e 's/\s+/ /g' $1.old > $1
