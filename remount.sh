#!/bin/sh
while true 
do

	mount -o rw,remount /system/etc/hosts
	echo "$(date)"
	sleep 10
done
