#!/bin/bash

FILENAME_TMP="archlinux.html"
OUTFILE="archlinux-latest.json"
TEMPLATE_FILENAME="template-archlinux.json"

curl -s "https://mirror.arizona.edu/archlinux/iso/latest/sha1sums.txt" >$FILENAME_TMP

checksum=$(cat $FILENAME_TMP | grep iso | cut -d' ' -f1)
echo "checksum:$checksum"

filename=$(cat $FILENAME_TMP | grep iso | tr -s ' ' | cut -d' ' -f2)
echo "filename:$filename"

version=$(echo $filename | cut -d'-' -f2)
echo "version:$version"

sed 's/__ISO_CHECKSUM__/'${checksum}'/g; s/__ISO_NAME__/'${filename}'/g; s/__ISO_VERSION__/'${version}'/g; s#__ISO_URL__#https://mirror.arizona.edu/archlinux/iso/latest/'${filename}'#g' ${TEMPLATE_FILENAME} >$OUTFILE
