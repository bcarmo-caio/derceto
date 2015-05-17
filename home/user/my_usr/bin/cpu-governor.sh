#!/bin/bash

gov=0

while [ $gov -lt 1 ] || [ $gov -gt 5 ] ; do
	echo "Choose one governor"
	echo -e "\t1 - conservative"
	echo -e "\t2 - userspace"
	echo -e "\t3 - powersave"
	echo -e "\t4 - ondemand"
	echo -e "\t5 - performance"

read gov
done

case $gov in
	"1")
		gov="conservative" ;;
	"2")
		gov="userspace" ;;
	"3")
		gov="powersave" ;;
	"4")
		gov="ondemand";;
	"5")
		gov="performance" ;;
esac

for i in 0 1 2 3; do cpufreq-set -c $i -g $gov; done

exit 0
