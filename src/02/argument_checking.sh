#!/bin/bash

if [[ $# -ne 3 ]]
then
    echo "You did not enter 3 arguments."
    exit 1
    fi

abcdir=$1
len1=${#abcdir}

if [[ ! "$abcdir" =~ [A-Za-z]+$ ]]; then
    echo "Error in 1 argument. You must enter English letters!"
    exit 1
    fi

if [ $len1 -le 4 ]; then
    echo "Error in 1 argument. You entered less than 5 characters!"
    exit 1
    fi

if [ $len1 -gt 7 ]; then
    echo "Error in 1 argument. You entered more than 7 characters!"
    exit 1
    fi

if [[ ! "$abcdir" =~ [A-Za-z]+$ ]]; then
    echo "Error in 1 argument. You must enter English letters!"
    exit 1
    fi
	
for (( w=0; w<$len1; w++ )); do
	z=1+$w
	for (( ; z<$len1; z++ )); do
	first=${abcdir:$w:1}
	second=${abcdir:$z:1}
		if [[ $first == $second ]]; then
			echo "Error in 1 argument. Replace duplicate characters!"
			exit 1
			fi
		done
	done	
    
abcfile=$2
filename=${abcfile%.*}
len2=${#filename}
extension=${abcfile##*.}
len3=${#extension}
len3=${#extension}
len4=${#abcfile}
w=0
for (( q=0; q < len4; q++ ))
do
	filenamesearch=${abcfile:q:1}
	if [[ $filenamesearch  == '.' ]]; then
		((w++));
		fi
	if [[ $w  -ge 2 ]]; then
		echo "Error in 2nd argument. More than one point entered!"
    	exit 1
    	fi
done

if [[ ! "$abcfile" =~ ^[A-Za-z.]+$ ]]; then
    echo "Error in 2nd argument. You must enter English letters and a dot for the expansion!"
    exit 1
    fi

if [[ $w -eq 0 ]]; then
	echo "Error in 2nd argument. You didn't enter an extension for 2 arguments!"
	exit 1
	fi
	
if [ $len2 -le 4 ]; then
    echo "Error in 2nd argument. You entered less than 5 characters!"
    exit 1
    fi
	
if [ $len2 -gt 7 ]; then
    echo "Error in 2nd argument. You entered more than 7 characters for the filename!"
    exit 1
    fi
	
for (( o=0; o<$len2; o++ )); do
	p=1+$o
	for (( ; p<$len2; p++ )); do
	first=${filename:$o:1}
	second=${filename:$p:1}
		if [[ $first == $second ]]; then
			echo "Error in 2 argument. Replace duplicate characters!"
			exit 1
			fi
		done
	done

if [ $len3 -eq 0 ]; then
    echo "Error in 2nd argument. You have not entered any English letters for the extension!"
    exit 1
    fi

if [ $len3 -gt 3 ]; then
    echo "Error in 2nd argument. You have entered more than 3 characters for the extension!"
    exit 1
    fi
	
if [[ ! "$abcfile" =~ ^[A-Za-z.]+$ ]]; then
    echo "Error in 2nd argument. You must enter English letters and a dot for the expansion!"
    exit 1
    fi

    
size=$3
len5=${#size}
len6=$((len5-2))
kilobytes=${size:len6:2}

filesize=${3%??}
if [[ ! "$filesize" =~ ^[0-9,]+$ ]]; then
    echo "Error in 3rd argument. You must enter numbers (up to 100) and a comma if the number is floating point!"
    exit 1
    fi
if [[ "$filesize" -gt 100 ]]; then
	echo "Error in 3rd argument. You must enter a file size of no more than 100mb!"
	exit 1
	fi
if [[ "$kilobytes" != "mb" ]]; then
	echo "Error in 3rd argument. You must enter the size of the files in megabytes!"
	exit 1
	fi

filename2=$filename

echo "3 Arguments entered script is running!"
