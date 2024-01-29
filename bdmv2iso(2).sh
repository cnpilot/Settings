#!/bin/bash
#
CUR_PATH=`pwd`
find "$CUR_PATH" -iname "BDMV" >> path.txt
while read i
do
if [[ "$i" == *BDMV* ]]; then
        MV_PATH=`dirname "$i"`
        MV_NAME=`basename "$MV_PATH"`
        ISO=".iso"
        genisoimage -iso-level 4 -allow-lowercase -l -udf -allow-limited-size -o "$MV_NAME$ISO" "$MV_PATH"
        rm -rf "$MV_PATH"    
else
	echo "KO : BDMV Path not found... EXIT"
	exit 1
fi;
done < path.txt
rm -rf path.txt
