#!/bin/bash

if [ "$logfile" -eq 2 ]; then
	> 05-2.log
	cat "$url"access1.log <(echo) "$url"access2.log  <(echo) "$url"access3.log <(echo) "$url"access4.log <(echo) "$url"access5.log > 05-2.log
	uniqueip=$(cat 05-2.log | sort | uniq -u)
	echo "$uniqueip" > 05-2.log
	fi