#!/bin/bash

USERPRAEFIX="testee"

FILEPRAEFIX="Abgabe_"

for ((i=1;i<=90;i++)) do
	if  ((i<10)); then
		USERNAME=${USERPRAEFIX}00$i
	else
		USERNAME=${USERPRAEFIX}0$i
	fi
	echo "create Directory for Testee:" $USERNAME
	mkdir $FILEPRAEFIX$USERNAME
	chmod 770 $FILEPRAEFIX$USERNAME
	chown $USERNAME:Teachers $FILEPRAEFIX$USERNAME
done

for ((i=101;i<=190;i++)) do
	USERNAME=${USERPRAEFIX}$i
	echo "create Directory for Testee:" $USERNAME
	mkdir $FILEPRAEFIX$USERNAME
	chmod 770 $FILEPRAEFIX$USERNAME
	chown $USERNAME:Teachers $FILEPRAEFIX$USERNAME
done


