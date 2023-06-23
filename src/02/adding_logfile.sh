#!/bin/bash

touch 02.log
cat /dev/null > 02.log
cat /dev/null > error.log
datestart=$(date +%s)
echo "Start-$(date +"%D-%T")" >> 02.log
datestartscript=$(date +"%D-%T")
