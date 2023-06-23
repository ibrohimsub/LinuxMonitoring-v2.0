#!/bin/bash
LANG=en_us_8859_1

min=$(( 60 * 1 ))
n=0
day=$(date +%d)
datenow=$(date +%b/%Y)
b=1
for ((i=0; i < 5; i++))
do
	logcount=$((($RANDOM%900)+100))
	. adding_logfile.sh
	for ((a=0; a < logcount; a++))
	do
		(( time += min ))
		date=$(date -d "@$time" '+%T')
		. adding_ip.sh
		. adding_method.sh
		. adding_url.sh
		. adding_code.sh
		. adding_agent.sh
		. adding_page_size.sh
	echo "$ip1"."$ip2"."$ip3"."$ip4" " - - "["$day"/"$datenow":"$date" +0000] '"'"$method" /"$url"/index.html HTTP/1.1'"' "$code" "$size" '"'-'"' '"'"Mozilla/5.0" "$agent"'"' >> access$b.log
	done
	((day--))
	((b++))
done





