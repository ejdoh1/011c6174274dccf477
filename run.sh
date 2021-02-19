
#!/bin/bash

FILENAME_TMP="archlinux.html"
OUTFILE="archlinux-latest.json"

curl -s "https://mirror.arizona.edu/archlinux/iso/latest/sha1sums.txt" > $FILENAME_TMP

checksum=$(cat $FILENAME_TMP | grep iso | cut -d' ' -f1)
echo "checksum:$checksum"

filename=$(cat $FILENAME_TMP | grep iso | tr -s ' ' | cut -d' ' -f2)
echo "filename:$filename"

version=`echo $filename | cut -d'-' -f2`
echo "version:$version"

s='''{
    "variables": {
        "iso_checksum": "%s",
        "iso_name": "%s",
        "version": "%s"
    }
}'''

echo $(printf "$s" "$checksum", "$filename", "$version") > $OUTFILE
