#!/bin/bash

IFS=$'\n'
v=0
coutfile=1
c=0
> error.log
for url in $array
do
	if [[ $coutfile -eq 101 ]]; then
		dateend=$(date +%s)
		datetotal=$((dateend-datestart))
		echo "Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." >> 02.log
		echo "Start-$datestartscript. Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." 
		exit 0
		fi
	if [[ $v -eq $len1 ]]; then
		v=0
		if [[ $c -eq $len1 ]]; then
			c=0
			fi
		c=$v+$c
		word1=${abcdir:c:1}
		((c++))
		abcdir="$abcdir$word1"
		fi
	. check_free_space.sh
	word1=${abcdir:v:1}
	date1=$(date +%d%m%y)
	log_date1=$(date +%F)
	mkdir "$url"/"$abcdir""$word1"_"$date1" 2>> error.log
	echo "$log_date1"" ""$url"/"$abcdir""$word1"_"$date1" >> 02.log
	filename=$filename2
	b=0
	for (( j=0, a=0; j < $coutfile; j++, a++ ))
	do
		if [ ! -d "$url"/"$abcdir""$word1"_"$date1" ]; then
			continue
			fi	
		if [[ $a -eq $len2 ]]; then
			a=0
			if [[ $b -eq $len2 ]]; then
				b=0
				fi
			b=$a+$b
			word2=${filename:b:1}
			((b++))
			filename="$filename$word2"
			fi
		. check_free_space.sh
		word2=${filename:a:1}
		date2=$(date +%d%m%y)
		log_date2=$(date +%F)
		touch "$url"/"$abcdir""$word1"_"$date1"/"$filename""$word2"_"$date2"."$extension" 2>> error.log
		fallocate -l "$filesize"M "$url"/"$abcdir""$word1"_"$date1"/"$filename""$word2"_"$date2"."$extension" 2> /dev/null
		echo ""$log_date2"    "$url"/"$abcdir""$word1"_"$date1"/"$filename""$word2"_"$date2"."$extension"	"$filesize""MB"" >> 02.log
	done
	if [ ! -d "$url"/"$abcdir""$word1"_"$date1" ]; then
		((a--))
		continue
		fi
	((v++))
	((coutfile++))
	done
dateend=$(date +%s)
datetotal=$((dateend-datestart))
echo "Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." >> 02.log
echo "Start-$datestartscript. Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." 
