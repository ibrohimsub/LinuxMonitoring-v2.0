#!/bin/bash

size=$(df -k / | awk 'NR==2 {print $4}')
if [[ $size -le 1048576 ]]; then
	echo "The / partition is less than or equal to 1 GB. Script stopped!"
	if [ -f 02.log ]; then
		dateend=$(date +%s)
		datetotal=$((dateend-datestart))
		echo "Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." >> 02.log
		fi
	exit 1
	fi
