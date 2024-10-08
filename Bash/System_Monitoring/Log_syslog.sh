#!/bin/bash
#
exit_status=$?

if [ $exit_status -eq 0 ]
then	
	logger Success From Script
else
	echo "Bad, Not Printed to /var/log/syslog"
fi
