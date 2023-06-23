#!/bin/bash

if [[ "$logfile" -eq 1 ]]; then
	echo -e "Enter the path where the files are located."
	read url
	content=$(cat "$url"02.log | awk '{print $2}' | tac)
	if [ -e "$url"02.log ]; then
		echo "File found! The script is running."
		for delcontent in $content
		do
			echo "$delcontent" >> 03.log
			rm -rf $delcontent
		done
	else
		echo "File not found!"
	fi
fi
