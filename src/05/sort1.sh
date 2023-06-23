#!/bin/bash

if [[ "$logfile" -eq 1 ]]; then
	> 05-1.log
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "200" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "201" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "400" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "401" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "403" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "404" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "500" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
	for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "501" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
		for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "502" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
		for str in $content
	do
		if [[ $(echo "$str" |  awk '{print $9}') == "503" ]]; then
			echo "$str" >> 05-1.log
		fi
	done
	fi