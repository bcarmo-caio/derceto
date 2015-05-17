#!/bin/bash
cd /boot/gift/
while true; do
	for i in $(seq 0 11); do
		echo "q" | ./fbv -c -u -i --upper-right gift"$i".png
		sleep .15
	done
done

exit 0
