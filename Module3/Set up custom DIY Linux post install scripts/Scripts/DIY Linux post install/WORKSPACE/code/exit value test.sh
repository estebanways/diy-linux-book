#!/bin/bash
# Name: exit value test.sh
# Description:
# Version: 0.0.1. Date: Friday, June 30, 2017
# Author: Esteban Herrera

# Run as user no install permissions to see the error!

echo "Thanks for using the script"
# Exit codes are useful to programs that call your program. If your program
# finishes with exit code 0 then that generally means your program "succeeded".
# An exit code of 1 generally means that it failed. Maybe the program tried to
# open a file that didn't exist or something. This would tell the calling program
# that it might not want to continue.
#apt-get update

# Add after every command to verify if failed
apt-get update
rc=$?; if [[ $rc != 0 ]]; then "------ SOMETHING WENT WRONG WITH THE CURRENT ACTION. RERUN THE PROGRAM TO COMPLETE THE INSTALLATION ------. ERROR MESSAGE" exit $rc; fi


NEXT CODE IS A WORK IN PROGRESS:

# This echo doesn't show "Command error:" and doesn't even appear after $? codes
if [[ $rc != 0 ]]; then
	if [[ $rc != 1 ]]; then echo "Echoooo before error!"; 
	fi;
fi

# Do not use echoes without IF code above, or $? codes will throw them to the output after the $? error message
if [[ $rc = 0 ]]; then "DO NOT USE ECHO"; fi
if [[ $rc != 0 ]]; then "DO NOT USE ECHO"; fi
echo "Return code (0 = suceed):"
echo "Return code (0 = suceed):"
echo "Return code (0 = suceed):"
echo "Return code"

