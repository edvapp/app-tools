#!/bin/bash

BASE="testee"
for ((i=1;i<=90;i++)) do
	if  ((i<10)); then
		NAME=${BASE}00$i
	else
		NAME=${BASE}0$i
	fi
	echo "create Directory for Testee:" $NAME
	cp -R /home/templateUser $NAME
	chmod -R 775 $NAME
	chown -R root:root $NAME
done