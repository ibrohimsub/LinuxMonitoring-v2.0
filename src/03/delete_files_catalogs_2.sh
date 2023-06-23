#!/bin/bash

if [[ "$logfile" -eq 2 ]]; then
	echo -e "To delete files, you must enter the date range one by one!"
	echo -e "Enter the date and time in format YYYY-MM-DD HH:MI:SS : "
	read firstdate;
	if [[ -z  "$firstdate" ]]; then
        echo "Empty value, script completed!"
		exit 1
    fi
	echo -e "Enter the date and time in format YYYY-MM-DD HH:MI:SS : "
	read secondate;
	if [[ -z  "$secondate" ]]; then
        echo "Empty value, script completed!"
		exit 1
    fi
	echo "Dates entered! The script is running."
	v=0

	for url in $(find / -name '*_*' -type d -not -path  '*sbin*' -not -path '*bin*' -newerct "$firstdate" ! -newerct "$secondate" 2>/dev/null)
	do
		((v++))
		echo "$url" >> 03.log
		rm -rf "$url";
	done
fi
