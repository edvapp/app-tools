#!/bin/bash

# source users and containers
# following variables are sourced
# ADMIN_ACCOUNT_NAME="cn=admin,dc=example,dc=com"
# CONTAINER_NAME="ou=containerPupils,ou=users,dc=example,dc=com"
# GROUP_NAME="cn=Default-Users,ou=groups,dc=example,dc=com"
. ./secrets/controlTeachersGroupMembershipTeachers-SECRET.sh

. ./controlContainerGroupMembershipLogic.sh
