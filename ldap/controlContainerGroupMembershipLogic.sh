#!/bin/bash

echo "Please type LDAP - Password"
read LDAPPASSWORD

# search for posixAccount and just show attribute
UIDS_IN_CONTAINER=$(ldapsearch -LLL -D "$ADMIN_ACCOUNT_NAME" -h ldap01 -w $LDAPPASSWORD -b "$CONTAINER_NAME" uid | grep ^uid | awk '{ print $2}')
#echo $UIDS_IN_CONTAINER
UIDS_IN_GROUP=$(ldapsearch -LLL -D "$ADMIN_ACCOUNT_NAME" -h ldap01 -w $LDAPPASSWORD -b "$GROUP_NAME" memberUid | grep memberUid | awk '{ print $2}')
#echo $UIDS_IN_GROUP

echo "Users from Container $CONTAINER_NAME, not in Group: $GROUP_NAME"
for uid_in_container in $UIDS_IN_CONTAINER;
do
	echo "$UIDS_IN_GROUP" | grep -q "$uid_in_container"
	if ! [ $? -eq 0 ];
	then
		echo $uid_in_container
	fi
done
