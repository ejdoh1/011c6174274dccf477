#!/bin/bash

HTML="fedora.html"
CHECKSUM="fedora-checksum"
OUTFILE="fedora-latest.json"
TEMPLATE_FILENAME="template-fedora.json"

curl -s http://mirror.aarnet.edu.au/pub/fedora/linux/releases/ > $HTML

version=$(cat $HTML | tr -s ' ' | grep " -" | cut -d'"' -f8 | grep ^[0-9] | tail -n1 | cut -d'/' -f1)
echo "version:$version"

checksum_filename=$(curl -s http://mirror.aarnet.edu.au/pub/fedora/linux/releases/${version}/Server/x86_64/iso/ | grep CHECKSUM | cut -d'"' -f8)
echo "checksum_filename:$checksum_filename"

curl -s "http://mirror.aarnet.edu.au/pub/fedora/linux/releases/${version}/Server/x86_64/iso/${checksum_filename}" > $CHECKSUM

line=$(cat $CHECKSUM | grep dvd | grep -i sha256)

checksum=$(echo $line | cut -d"=" -f2 | tr -d '[:space:]')
echo "checksum:$checksum"

filename=$(echo $line | cut -d"(" -f2 | cut -d")" -f1)
echo "filename:${filename}"

sed 's/__ISO_CHECKSUM__/'${checksum}'/g; s/__ISO_NAME__/'${filename}'/g; s/__ISO_VERSION__/'${version}'/g; s#__ISO_URL__#http://mirror.aarnet.edu.au/pub/fedora/linux/releases/'${version}'/Server/x86_64/iso/'${filename}'#g' ${TEMPLATE_FILENAME} >$OUTFILE
