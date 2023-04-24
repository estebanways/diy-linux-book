#!/bin/bash
#
# WARNING: Verify Internet connection and sources /etc/apt/ and /etc/apt/sources.list,
# operating system (Debian GNU/Linux 9 or later) and architecture (32bit) before
# running this script.
#
# Name: install sound sources i686.sh
# Description: Installs profesional audio applications from the Official Debian
# repositories
# Version: 0.0.1. Date: Friday, June 30, 2017
# Author: Esteban Herrera
#
# Use next commands to update the content of this file:
# To create every application list:
# $ sudo nano /etc/apt/sources.list
# $ sudo apt-get update
# $ apt-cache search APPNAME APPNAME2
# $ apt-cache search APPNAME APPNAME2>APPNAME\ APPNAME2.txt
# If you want to create every App and Plugin txt content: 
# $ cd SoundNG/
# $ *.txt > INSTALL-CONTENT.txt
#
# Debugging: Running a shell script with -x option enables the display of commands
# and its arguments when they are executed. EG: # sh -x script.sh

DATE=$(date)
TIME="TIMESTAMP:"
COLON=":"
TOTDATE=$TIME+$DATE+$COLON



# Program start warning 
echo "INSTALL 32bit.sh" 
echo "Installs profesional audio applications from the Official Debian repositories"
echo "Version: 0.0.1. Date: Friday, June 30, 2017"
echo "Author: Esteban Herrera"
echo "Queue initialized... wait for the program to finish"

# "2>&1 | tee -a /path/to/logfile.log" This means: run command and redirect 
# the stderr stream (2) to stdout (1). That will be passed to the pipe with
# the tee application. Use the -a option to append (>>) and show the output in the shell.

# Update the system repository sources in /etc/apt/sources and /etc/apt/sources.list
echo "Updating the system sources from /etc/apt/sources and /etc/apt/sources.list files..."
apt-get update 2>&1 | tee -a logfile.log
rc=$?; if [[ $rc != 0 ]]; then "------ SOMETHING WENT WRONG WITH THE CURRENT ACTION. RERUN THE PROGRAM TO COMPLETE THE INSTALLATION ------. ERROR MESSAGE" exit $rc; fi


