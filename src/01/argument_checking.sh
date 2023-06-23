#!/bin/bash

if [[ $# -ne 6 ]]
then
    echo 'You did not enter 6 arguments'
    exit 1
    fi

url=$1
if [ ! -d "$url" ]; then
    echo "Error in 1 argument. Directory at $url does not exist!"
    exit 1
    fi

coutdir=$2
if [[ ! "$coutdir" =~ ^[0-9]+$ ]]; then
    echo "Error in 2 argument. Numbers required!"
    exit 1
    fi

abcdir=$3
len1=${#abcdir}

if [ $len1 -le 3 ]; then
    echo "Error in argument 3. You entered less than 4 characters!"
    exit 1
    fi

if [ $len1 -gt 7 ]; then
    echo "Error in argument 3. You entered more than 7 characters!"
    exit 1
    fi

for (( w=0; w<$len1; w++ )); do
	z=1+$w
	for (( ; z<$len1; z++ )); do
	first=${abcdir:$w:1}
	second=${abcdir:$z:1}
		if [[ $first == $second ]]; then
			echo "Error in 3rd argument. Replace duplicate characters!"
			exit 1
			fi
		done
	done

if [[ ! "$abcdir" =~ [A-Za-z]+$ ]]; then
    echo "Error in 3rd argument. You must enter English letters!"
    exit 1
    fi
    
coutfile=$4
if [[ ! "$coutfile" =~ [0-9]+$ ]]; then
    echo "Error in 4th argument. Numbers required!"
    exit 1
    fi

abcfile=$5
filename=${abcfile%.*}
len2=${#filename}
extension=${abcfile##*.}
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
		echo "Error in 5th argument. More than one point entered!"
    	exit 1
    	fi
done
if [[ $w -eq 0 ]]; then
	echo "Error in 5th argument. You didn't enter an extension for the 5th argument!"
	exit 1
	fi
	
if [ $len2 -le 3 ]; then
    echo "An error in the 5th argument. You entered less than 4 characters!"
    exit 1
    fi

if [ $len2 -gt 7 ]; then
    echo "Error in 5th argument. You entered more than 7 characters for the filename!"
    exit 1
    fi
	
for (( o=0; o<$len2; o++ )); do
	p=1+$o
	for (( ; p<$len2; p++ )); do
	first=${filename:$o:1}
	second=${filename:$p:1}
		if [[ $first == $second ]]; then
			echo "An error in the 5th argument. Replace duplicate characters!"
			exit 1
			fi
		done
	done
	
if [ $len3 -eq 0 ]; then
    echo "Error in 5th argument. You have not entered any English letters for the extension!"
    exit 1
    fi

if [ $len3 -gt 3 ]; then
    echo "Error in 5th argument. You have entered more than 3 characters for the extension!"
    exit 1
    fi
if [[ ! "$abcfile" =~ ^[A-Za-z.]+$ ]]; then
    echo "Error in 5th argument. You must enter English letters and a dot for the expansion!"
    exit 1
    fi
if [[ ! "$abcfile" =~ ^[A-Za-z.]+$ ]]; then
    echo "Error in 5th argument. You must enter English letters and a dot for the expansion!"
    exit 1
    fi

size=$6
len5=${#size}
len6=$((len5-2))
kilobytes=${size:len6:2}

filesize=${6%??}
if [[ ! "$filesize" =~ ^[0-9,]+$ ]]; then
    echo "Error in 6th argument. You must enter numbers (up to 100) and a comma if the number is floating point!"
    exit 1
    fi
if [[ "$filesize" -gt 100 ]]; then
	echo "Error in 6th argument. You must enter a file size of no more than 100kb!"
	exit 1
	fi
if [[ "$kilobytes" != "kb" ]]; then
	echo "Error in 6th argument. You must enter the size of the files in kilobytes!"
	exit 1
	fi

filename2=$filename

echo "6 Arguments entered script is running!"
