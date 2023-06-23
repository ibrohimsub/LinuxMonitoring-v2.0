#!/bin/bash

IFS=$'\n'
echo -e "Enter the address where the files are located."
read url
content=$(cat "$url"access1.log <(echo) "$url"access2.log  <(echo) "$url"access3.log <(echo) "$url"access4.log <(echo) "$url"access5.log)
count=0
if [ ! -e "$url"access1.log ]; then
        echo "Files not found!"
        exit 1
    fi