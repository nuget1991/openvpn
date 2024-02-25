#!/bin/bash

sleep_time=15


up() {
	sleep $sleep_time
	ip route add default via 10.7.0.5 table 100 && ip rule add from 10.8.0.0/24 table 100

	if [ $? -eq 0 ]; then
		echo Added
			else
			echo Failed
	fi
}

down() {
	ip rule del from 10.8.0.0/24 table 100 && ip route del default via 10.7.0.5 table 100
	if [ $? -eq 0 ]; then
		echo Removed
			else
			echo Failed
	fi
}

if [ -z $1 ]; then
	echo "Could not read script action" ; exit 0
fi

$1

exit 0
