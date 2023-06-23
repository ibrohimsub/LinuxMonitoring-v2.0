#!/bin/bash

ip1=$(($RANDOM%255))
if [[ $ip1 -eq 0 ]]; then
	ip1="1"
	fi
ip2=$(($RANDOM%255))
ip3=$(($RANDOM%255))
ip4=$(($RANDOM%255))
	