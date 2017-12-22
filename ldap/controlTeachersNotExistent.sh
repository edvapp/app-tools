#!/bin/bash

# Check vor Teachers, who are listet in a Group, but have no account

echo "Please type LDAP - Password"
read LDAPPASSWORD

# search for posixAccount and just show attribute
#UIDS_IN_CONTAINER=$(ldapsearch -LLL -D "cn=admin,dc=app,dc=net" -h ldap01 -w $LDAPPASSWORD -b ou=containerTeachers,ou=users,dc=app,dc=net uid | grep ^uid | awk '{ print $2}')
UIDS_IN_CONTAINER=$(ldapsearch -LLL -D "cn=admin,dc=app,dc=net" -h ldap01 -w $LDAPPASSWORD -b dc=app,dc=net uid | grep ^uid | awk '{ print $2}')
#echo $UIDS_IN_CONTAINER
UIDS_IN_GROUP=$(ldapsearch -LLL -D "cn=admin,dc=app,dc=net" -h ldap01 -w $LDAPPASSWORD -b "cn=Default Users,ou=groups,dc=app,dc=net" memberUid | grep memberUid | awk '{ print $2}')
#echo $UIDS_IN_GROUP
echo "Users from Group: cn=Default Users,ou=groups,dc=app,dc=net with NO UID"
for uid_in_group in $UIDS_IN_GROUP;
do
	echo "$UIDS_IN_CONTAINER" | grep -q "$uid_in_group"
	if ! [ $? -eq 0 ];
	then
		echo $uid_in_group
	fi
done

UIDS_IN_GROUP=$(ldapsearch -LLL -D "cn=admin,dc=app,dc=net" -h ldap01 -w $LDAPPASSWORD -b "cn=Teachers,ou=groups,dc=app,dc=net" memberUid | grep memberUid | awk '{ print $2}')
#echo $UIDS_IN_GROUP
echo "Users from Group: cn=Teachers,ou=groups,dc=app,dc=net with NO UID"
for uid_in_group in $UIDS_IN_GROUP;
do
	echo "$UIDS_IN_CONTAINER" | grep -q "$uid_in_group"
	if ! [ $? -eq 0 ];
	then
		echo $uid_in_group
	fi
done
