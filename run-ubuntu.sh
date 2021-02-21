#!/bin/bash
set -e

UBUNTU_HTML="ubuntu.html"
UBUNTU_CHECKSUM="ubuntu-checksum"
OUTFILE="ubuntu-latest.json"
TEMPLATE_FILENAME="template-ubuntu.json"

curl -s https://mirror.arizona.edu/ubuntu-releases/ > $UBUNTU_HTML

version=$(cat $UBUNTU_HTML | tr -s ' ' | grep " -" | cut -d'"' -f6 | grep ^[0-9] | tail -n1 | cut -d'/' -f1)
echo "version:${version}"

curl -s https://mirror.arizona.edu/ubuntu-releases/${version}/SHA256SUMS > $UBUNTU_CHECKSUM

line=$(cat $UBUNTU_CHECKSUM | grep server)

checksum=$(echo $line | cut -d" " -f1)
echo "checksum:${checksum}"

filename=$(echo $line | cut -d"*" -f2)
echo "filename${filename}"

sed 's/__ISO_CHECKSUM__/'${checksum}'/g; s/__ISO_NAME__/'${filename}'/g; s/__ISO_VERSION__/'${version}'/g; s#__ISO_URL__#https://mirror.arizona.edu/ubuntu-releases/'${version}'/'${filename}'#g' ${TEMPLATE_FILENAME} >$OUTFILE
