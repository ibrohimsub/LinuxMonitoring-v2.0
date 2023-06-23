#!/bin/bash

if [[ "$logfile" -eq 3 ]]; then
    echo -n "Enter name mask: "
    read maskname;
	if [[ -z "$maskname" ]]; then
        echo "Empty value, script completed!"
		exit 1
    fi
	echo "The mask is on! The script is running."
    mname=$(echo "$maskname" | awk 'BEGIN {FS = "_"}{print $1}')
    mdate=$(echo "$maskname" | awk 'BEGIN{FS = "_"}{print $2}')
	len=${#maskname}
	w=0
	datecheck=0


	for (( q=0; q < len; q++ ))
	do

		str=${maskname:q:1}
		if [[ $str == '.' ]]; then
			((w++));
			fi
		if [[ $str == '_' ]]; then
			((datecheck++));
			fi
		if [[ $w  -ge 2 ]]; then
			echo "Mask error. More than one point entered!"
			exit 1
			fi
	done
	if [[ $datecheck  -eq 0 ]]; then
		echo "Mask error. The date was not entered through a hard space!"
		exit 1
		fi
	if [[ $w -eq 0 ]]; then
		len1=${#mname}
		while [ ${#mname} -lt 5 ]
		do
			mname="$mname$mname"
		done
		c=0
		coutdir=100
		for (( i=0, v=0; i < $coutdir; i++,v++ ))
		do
			if [[ $coutdir -eq 101 ]]; then
				exit 1
				fi
			if [[ $v -eq $len1 ]]; then
				v=0
				if [[ $c -eq $len1 ]]; then
					c=0
					fi
				c=$v+$c
				word1=${mname:c:1}
				((c++))
				mname="$mname$word1"
				fi
			word1=${mname:v:1}
		url=$(find / -name ""$mname""$word1"_"$mdate"" -type d -not -path  '*sbin*' -not -path '*bin*' 2>/dev/null)
		for findurl in $url
		do
			echo "$findurl" >> 03.log
			rm -rf "$findurl";
		done
		done
	else
		len2=${#mname}
		extension=${mdate##*.}
		smdate=${mdate%.*}
		coutfile=100

		while [ ${#mname} -lt 5 ]
		do
			mname="$mname$mname"
		done
		b=0
		for (( j=0, a=0; j < $coutfile; j++, a++ ))
		do
			if [[ j -eq 101 ]]; then
				exit 1
				fi
			if [[ $a -eq $len2 ]]; then
				a=0
				if [[ $b -eq $len2 ]]; then
					b=0
					fi
				b=$a+$b
				word2=${mname:b:1}
				((b++))
				mname="$mname$word2"
				fi
			word2=${mname:a:1}
		
		url=$(find / -name ""$mname""$word2"_"$smdate"."$extension""  -not -path  '*sbin*' -not -path '*bin*' 2>/dev/null)
		for findurl in $url
		do
			sorturl=${findurl%/*}
			echo "$sorturl" >> 03.log
			rm -rf "$sorturl";
		done
		done
		fi
fi
