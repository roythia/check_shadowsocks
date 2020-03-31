#!/bin/bash
current_time=$(date +"%Y-%m-%d %H:%M:%S")
is_error=$(tail -n 1 /var/log/shadowsocks.log | grep -c "\[Errno 24\] Too many open files")

if ["${is_error}" = "1"]; then
	/etc/init.d/shadowsocks-python stop && /etc/init.d/shadowsocks-python start
	echo "[$current_time] An error was found and Shadowsocks service has been restarted." >> /var/log/ss-check.log
else
	echo "[$current_time] No errors found." >> /var/log/ss-check-24.log
fi