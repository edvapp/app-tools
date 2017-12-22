#!/bin/bash

# source users and containers
# following variables are sourced
# ADMIN_ACCOUNT_NAME="cn=admin,dc=example,dc=com"
# CONTAINER_NAME="ou=containerPupils,ou=users,dc=example,dc=com"
# GROUP_NAME="cn=Default-Users,ou=groups,dc=example,dc=com"
. ./secrets/controlTeachersGroupMembershipDefaultUsers-SECRET.sh

#. ./controlContainerGroupMembershipLogic.sh

echo "Please type LDAP - Password"
read LDAPPASSWORD

# search for posixAccount and just show attribute

ldapsearch -LLL -D "$ADMIN_ACCOUNT_NAME" -h ldap01 -w $LDAPPASSWORD -b "$CONTAINER_NAME" -S uidNumber uidNumber dn 

