#!/bin/bash
# DIY Linux post install - Installs and sets up sets of applications to 
# improve a custom GNU/Linux
# Copyright (C) 2017  Esteban Herrera.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#

# File name: Update_sources_in_etc_apt.bash
# Description: Updates system from sources set up under /etc/apt/.
# Version: 0.1.0. Date: Friday, June 30, 2017
# Development: Esteban Herrera. E-mail: stv.herrera@gmail.com. Web site: http://liquidsmok.hopto.org

UPDATE="/usr/bin/apt-get"

FILE=Update_sources.bash

DATE=$(date)
TIME="TIMESTAMP:"
COLON=":"
TOTDATE=$TIME+$DATE+$COLON

function log_error {
        rc=$?; if [[ $rc != 0 ]]; then "--- SOMETHING WENT WRONG IN ACTION: $ACTION. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE" exit $rc; fi 2>&1 | tee -a logfile.log
}

#
# Program start warning 
#
echo "$FILE initialized... wait for the program to finish or press CTRL + C" 2>&1 | tee -a logfile.log

#
# Update the system repository sources in /etc/apt/sources and /etc/apt/sources.list
#
echo $TOTDATE
ACTION="System sources updating"
echo "Action: "$ACTION": " 2>&1 | tee -a logfile.log
$UPDATE update 2>&1 | tee -a logfile.log
log_error;
