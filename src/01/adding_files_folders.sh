#!/bin/bash

c=0
for (( i=0, v=0; i < $coutdir; i++,v++ ))
do
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
	echo "$log_date1"" ""$url"/"$abcdir""$word1"_"$date1" >> 01.log
	filename=$filename2
	b=0
	for (( j=0, a=0; j < $coutfile; j++, a++ ))
	do
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
		fallocate -l "$filesize"K "$url"/"$abcdir""$word1"_"$date1"/"$filename""$word2"_"$date2"."$extension" 2>> error.log
		echo "$log_date2""    ""$url"/"$abcdir""$word1"_"$date1"/"$filename""$word2"_"$date2"."$extension""	""$filesize"KB >> 01.log
	done
done
