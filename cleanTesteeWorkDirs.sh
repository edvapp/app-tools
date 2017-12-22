#!/bin/bash

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "Listing all Files"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
tree
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "Delete all? (y)es/(n)o"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
read YESNO
echo $YESNO
if [ "$YESNO" == "y" ];
then
	echo save directories
	tar -czf Abgabe-$(date +%Y%m%d).tar.gz *
	# regular expression has to be in own variable
	# direct use in if does not work. ????
	# [[ ]] instead [ ] needed in following if
	DIR_STARTS_WITH='Abgabe_testee[[:digit:]]{3}'
	for DIR in *;
	do
		if [[ -d $DIR && $DIR =~ $DIR_STARTS_WITH ]];
		then
			cd  $DIR
			echo "FILES/DIRECTORIES removed in: $(pwd)"
			rm -v -R *
			cd ..
		fi
	done
fi
