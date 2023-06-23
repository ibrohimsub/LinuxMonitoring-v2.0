#!/bin/bash

echo "Creates an access$b.log file with $logcount entries on $day day $(date +%m) of the month"
> "access$b.log"
touch "access$b.log"