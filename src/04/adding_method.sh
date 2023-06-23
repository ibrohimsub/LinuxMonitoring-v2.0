#!/bin/bash

method=$(($RANDOM%5))
if [[ $method -eq 0 ]]; then
	method="GET"
elif [[ $method -eq 1 ]]; then
	method="POST"
elif [[ $method -eq 2 ]]; then
	method="PUT"
elif [[ $method -eq 3 ]]; then
	method="PATCH"
elif [[ $method -eq 4 ]]; then
	method="DELETE"
	fi

