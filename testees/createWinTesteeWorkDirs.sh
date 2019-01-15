#!/bin/bash

BASE="testee"
for ((i=1;i<=90;i++)) do
	if  ((i<10)); then
		NAME=${BASE}00$i
	else
		NAME=${BASE}0$i
	fi
	echo "create Directory for Testee:" $NAME
	mkdir $NAME
	chmod 770 $NAME
	chown $NAME:Teachers $NAME
done