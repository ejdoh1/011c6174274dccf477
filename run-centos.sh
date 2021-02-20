#!/bin/bash

CENTOS_HTML="centos.html"
CENTOS_CHECKSUM="centos-checksum"
OUTFILE="centos-latest.json"
TEMPLATE_FILENAME="template-centos.json"

# curl -s http://centos.mirror.digitalpacific.com.au/ > $CENTOS_HTML

# version=$(cat $CENTOS_HTML | tr -s ' ' | grep " -" | cut -d'"' -f2 | grep ^[0-9] | tail -n1 | cut -d'/' -f1)
# echo $version

# curl -s http://centos.mirror.digitalpacific.com.au/${version}/isos/x86_64/CHECKSUM > $CENTOS_CHECKSUM

line=$(cat $CENTOS_CHECKSUM | grep dvd | grep -i sha256)

checksum=$(echo $line | cut -d"=" -f2 | tr -d '[:space:]')
echo $checksum

filename=$(echo $line | cut -d"(" -f2 | cut -d")" -f1)
echo $filename

sed 's/__ISO_CHECKSUM__/'${checksum}'/g; s/__ISO_NAME__/'${filename}'/g; s/__ISO_VERSION__/'${version}'/g; s#__ISO_URL__#http://centos.mirror.digitalpacific.com.au/'${version}'/isos/x86_64/'${filename}'#g' ${TEMPLATE_FILENAME} >$OUTFILE

