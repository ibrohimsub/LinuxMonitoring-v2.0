#!/bin/bash

if [ "$logfile" -eq 3 ]; then
	> 05-3.log
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "400" ]]; then
			echo "$str" >> 05-3.log
			((count++))
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "401" ]]; then
			echo "$str" >> 05-3.log
			((count++))
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "403" ]]; then
			echo "$str" >> 05-3.log
			((count++))
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "404" ]]; then
			echo "$str" >> 05-3.log
			((count++))
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "500" ]]; then
			echo "$str" >> 05-3.log
			((count++))
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "501" ]]; then
			echo "$str" >> 05-3.log
			((count++))
		fi
	done
		for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "502" ]]; then
			echo "$str" >> 05-3.log
			((count++))
		fi
	done
		for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "503" ]]; then
			echo "$str" >> 05-3.log
			((count++))
		fi
	done
	if [[ $count -eq 0 ]]; then
		echo "There are no requests with errors (response code - 4xx or 5xx)"
		fi
	fi