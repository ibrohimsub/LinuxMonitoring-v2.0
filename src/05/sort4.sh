#!/bin/bash

if [ "$logfile" -eq 4 ]; then
	> 05-4.log
	> 05-5.log
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "400" || $(echo "$str" |  awk '{print $9}') == "401" || $(echo "$str" |  awk '{print $9}') == "403" || $(echo "$str" |  awk '{print $9}') == "404" || $(echo "$str" |  awk '{print $9}') == "500" || $(echo "$str" |  awk '{print $9}') == "501" || $(echo "$str" |  awk '{print $9}') == "502" || $(echo "$str" |  awk '{print $9}') == "503" ]]; then
			echo "$str" >> 05-5.log
			((count++))
		fi
	done
	uniqueip=$(cat 05-5.log | sort | uniq -u)
	echo "$uniqueip" > 05-4.log
	rm -rf 05-5.log
	fi