#!/bin/bash
######################################################################
#
# WANsim install script v1.1 by Ferry Hendrikx, (c) 2009
#
# An install script for non-Debian or source code users of WANsim.
#
# This script is based on the Debian install script, however it has 
# not been extensively tested.
#
######################################################################

# check we're running as root

if [ `whoami` != 'root' ]; then
    echo "You must be root to run this install script"

    exit 0
fi


# confirm

echo "WARNING: This script is experimental, use with care!"
echo ""

read


# add WANsim setup script

if [ -e "usr/sbin/wansimsetup" ]; then
    cp -f usr/sbin/wansimsetup /usr/sbin/
    chown root:root /usr/sbin/wansimsetup
fi


# add WANsim user

echo "Add WANsim user"

adduser --system --group --shell /usr/sbin/wansimsetup --home /var/lib/wansim wansim || exit $?

# fix permissions problems
chown -R wansim:wansim /var/lib/wansim
chmod -R u+rw /var/lib/wansim

echo "- done (no password set)"


# add WANsim user to sudoers

echo "Add WANsim user to sudoers"

FILE="/etc/sudoers"

if [ -w "${FILE}" ]; then
    # FIXME: Assumes Debian system

    echo "wansim\tALL=NOPASSWD: /usr/sbin/invoke-rc.d" >> ${FILE}

    echo "- done"
else
    echo "- skipped, $FILE not found (or not writable)"
fi


# add WANsim init.d script

echo "Add WANsim init.d script"

if [ -e "etc/init.d/wansim" ]; then
    # copy it to the right place

    cp -f etc/init.d/wansim /etc/init.d/
    chown root:root /etc/init.d/wansim

    # add it into the system

    if [ -x "/usr/sbin/update-rc.d" ]; then
	    /usr/sbin/update-rc.d wansim start 10 2 3 4 5 . stop 60 0 . || exit $?

        echo "- done (using update-rc.d)"
    fi

    if [ -x "/sbin/chkconfig" ]; then
        /sbin/chkconfig --add wansim

        echo "- done (using chkconfig)"
    fi
else
    echo "- skipped, wansim init.d script not found"
fi


# add WANsim configuration files

echo "Add WANsim configuration files"

DEST="/var/lib/wansim"

if [ -d "usr/share/doc/wansim/examples" ]; then
    # copy it to the right place

    cp -f usr/share/doc/wansim/examples/* ${DEST}/
    chown wansim:wansim ${DEST}/*

    echo "- done"
else
    echo "- skipped, wansim configuration files not found"
fi


# fix for WANsim 1.4
# This file is now loaded and used if it exists 
# (in previous versions this file always existed)

if [ -e "${DEST}/interfaces.conf" ]; then
    mv -f ${DEST}/interfaces.conf ${DEST}/interfaces.conf.old

    echo "- renamed interfaces.conf to interfaces.conf.old"
fi


# finish

echo ""
echo "Please remember to set a password for the 'wansim' user"
echo ""

exit 0
