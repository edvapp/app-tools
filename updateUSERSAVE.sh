#!/bin/bash

# make a working copy
sudo cp -R -v /home/user /tmp/user.save.$(lsb_release -r -s)

# take ownership of user profile
sudo chown -R -v ttfinr:2000 /tmp/user.save.$(lsb_release -r -s)

# make readable/writable for NFS - use (root_squash!)
chmod -R -v a+rwX /tmp/user.save.$(lsb_release -r -s)

# save old user.save profile
file=/home/teachers/ttfinr/myGit/autoinstall/xBigFiles/user.save.$(lsb_release -r -s)
if [ -d $file ];
then
	echo "save old user.save"
	ls $file
	cp -R -v $file $file.$(date +%Y%m%d-%N )
fi

# remove existing user.save profile
rm -R -v $file

# copy new user profile to right place
cp -R -v /tmp/user.save.$(lsb_release -r -s) $file

# remove temporary user profile
rm -R -v /tmp/user.save.$(lsb_release -r -s)
