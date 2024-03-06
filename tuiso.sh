#!/bin/bash
# /home/boxbox/Creat_iso.sh "%F" "%N" "%G" "%D" "%L" "%R" "%C" "%Z" "%I"
sleep 2

path="$4"

cd "$path"

for dir in */; do
    genisoimage -o "${dir%/}.iso" -iso-level 4 -allow-lowercase -l -udf -allow-limited-size "$dir" && rm -r "$dir"
done
