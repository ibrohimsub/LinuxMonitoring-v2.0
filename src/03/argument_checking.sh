#!/bin/bash

if [[ $# -ne 1 ]]
then
    echo 'One argument required. From 1 to 3.'
    exit 1
    fi

logfile=$1
if [[ ! "$logfile" =~ [1-3]+$ ]]; then
	echo "One argument required. From 1 to 3."
	exit 1
	fi

if [[ "$logfile" -gt 4 ]]; then
	echo "One argument required. From 1 to 3."
	exit 1
fi
