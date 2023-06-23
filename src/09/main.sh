#!/bin/bash
#CPU_USAGE=$(cat /proc/stat |grep cpu |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print 100-$1}')
CPU_USAGE=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))
MEM_TOTAL=$(cat /proc/meminfo | grep "MemTotal" | grep -E -e [0-9]+ -o)
MEM_FREE=$(cat /proc/meminfo | grep "MemFree" | grep -E -e [0-9]+ -o)
MEM_AVAILABLE=$(cat /proc/meminfo | grep "MemAvailable" | grep -E -e [0-9]+ -o)
DISK_USED=$(df / | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $3}')
DISK_AVAILABLE=$(df / | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $4}')


rm -rf ./report.html
echo "# HELP cpu_usage Get CPU usage" >> report.html
echo "# TYPE cpu_usage gauge" >> report.html
echo "cpu_usage ${CPU_USAGE}" >> report.html
echo "# HELP mem_total Get total mem" >> report.html
echo "# TYPE mem_total gauge" >> report.html
echo "mem_total $MEM_TOTAL" >> report.html
echo "# HELP mem_free Get free mem" >> report.html
echo "# TYPE mem_free gauge" >> report.html
echo "mem_free $MEM_FREE" >> report.html
echo "# HELP mem_available Get mem available" >> report.html
echo "# TYPE mem_available gauge" >> report.html
echo "mem_available $MEM_AVAILABLE" >> report.html
echo "# HELP disk_used Get disk used" >> report.html
echo "# TYPE disk_used gauge" >> report.html
echo "disk_used $DISK_USED" >> report.html
echo "# HELP disk_available Get disk available" >> report.html
echo "# TYPE disk_available gauge" >> report.html
echo "disk_available $DISK_AVAILABLE" >> report.html

if ! [ -d "/var/www/html/metrics" ] ; then
    mkdir /var/www/html/metrics
fi
cp report.html /var/www/html/metrics/rep.html
