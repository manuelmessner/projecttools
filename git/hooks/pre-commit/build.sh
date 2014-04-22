#!/usr/bin/sh

#
# ------------------------------------------------------------------------------
#
# Try to run the makefile
#
# ------------------------------------------------------------------------------
#

if [[ -f Makefile ]]
then
    echo -e "\t[PRE-COMMIT]\tRunning make:"

    if make ${MAKEOPTS} one_time
    then
        echo -e "\t[PRE-COMMIT]\tMake successfull! Continuing..."
        exit 0
    else
        echo -e "\t[PRE-COMMIT]\tMake failed. You cannot commit!"
        exit 1
    fi
else
    echo -e "\t[PRE-COMMIT]\tNo Makefile found. exit(1)"
    exit 1
fi
