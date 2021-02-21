# Linux distro latest version scraper

Set of bash scripts to fetch the latest versions of Linux distros.  
Caution, HTML is not a reliable way to extract information and these scripts may need to be tweaked if the HTML changes.

## Instructions

```sh
./run-all.sh
# check the generated *-latest.json files

```

## Sample Output

```sh
mac:011c6174274dccf477 user$ ./run-all.sh 

Running Centos...
version:8.3.2011
checksum:aaf9d4b3071c16dbbda01dfe06085e5d0fdac76df323e3bbe87cce4318052247
filename:CentOS-8.3.2011-x86_64-dvd1.iso

Running Archlinux...
checksum:eb3b4995be6db3109e15c70a2ca1a6a9f76daf41
filename:archlinux-2021.02.01-x86_64.iso
version:2021.02.01

Running Ubuntu...
version:20.10
checksum:defdc1ad3af7b661fe2b4ee861fb6fdb5f52039389ef56da6efc05e6adfe3d45
filenameubuntu-20.10-live-server-amd64.iso

Running Fedroa...
version:33
checksum_filename:Fedora-Server-33-1.2-x86_64-CHECKSUM
checksum:4fe38b45a4c788927ddfdfb224c414f138226a75f27a287995d802cba3cb89d4
filename:Fedora-Server-dvd-x86_64-33-1.2.iso

Script complete
```
