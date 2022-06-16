#!/bin/sh
IP=$(hostname -I)
HOST=$(hostname)

# Check if autogen.sh completes
/openils/bin/autogen.sh

if [ $? = 0 ]; then
	echo "the task was successful"
	exit 0
else
	echo "The task failed...contact your System Administrator"
	echo "The Evergreen ILS service on host $HOST($IP) is not running" | mail -s "Evergreen failed to start..." helpdesk@apls.state.al.us
	exit 1

fi
