#!/bin/bash

DATE=$(date +"%d %b %y")
COLON=":"
TOTDATE=$DATE+$COLON

opt="1"
REPLY=2

echo "Running $opt which is option $REPLY" 2>&1 | tee -a logfile.log
echo $TOTDATE  2>&1 | tee -a logfile.log

echo "Running $opt which is option $REPLY" 2>&1 | tee -a logfile.log
date 2>&1 | tee -a logfile.log

echo "Running $opt which is option $REPLY" 2>&1 | tee -a logfile.log
date 2>&1 | tee -a logfile.log


echo "Running $opt which is option $REPLY" 2>&1 | tee -a logfile.log
date 2>&1 | tee -a logfile.log

