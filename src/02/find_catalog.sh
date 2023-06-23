#!/bin/bash

array=$(find / -mindepth 4 -maxdepth 4 -type d 2> /dev/null -perm /g+w,u+w | grep -v -e bin -e sbin -e sys -e snap -e Permission | shuf -n 1500)
