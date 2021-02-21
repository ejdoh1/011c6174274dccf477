#!/bin/bash

rm -f *.latest

echo -e "\nRunning Centos..."
./run-centos.sh
echo -e "\nRunning Archlinux..."
./run-archlinux.sh
echo -e "\nRunning Ubuntu..."
./run-ubuntu.sh
echo -e "\nRunning Fedroa..."
./run-fedora.sh

echo -e "\nScript complete\n"
