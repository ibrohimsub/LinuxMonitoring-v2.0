#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "One argument required. From 1 to 4."
    exit 1
    fi
	
logfile=$1
if [[ ! "$logfile" =~ [1-4]+$ ]]; then
	echo "One argument required. From 1 to 4."
	exit 1
	fi