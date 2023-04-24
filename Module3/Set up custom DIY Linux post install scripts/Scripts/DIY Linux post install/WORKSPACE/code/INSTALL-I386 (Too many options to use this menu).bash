#!/bin/bash
# DIY Linux Shell - Installs and sets up sets of applications to 
# improve a custom GNU/Linux Desktop
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

# File name: INSTALL.sh
# Description: Main menu
# Version: 0.1.0. Date: Friday, June 30, 2017
# Development: Esteban Herrera. E-mail: stv.herrera@gmail.com. Web site: http://liquidsmok.hopto.org

# DEBUGGING:
#
# Colors:
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
#
# printf "I ${RED}love${NC} DIY Linux\n"
# echo -e "I ${RED}love${NC} Stack Overflow"
# (don't add "\n" when using echo unless you want to add additional empty line)
#
# echo "">logfile.log
# bash INSTALL.sh
# cat logfile.log

RED='\033[0;31m'
LIGHTGREEN='\033[1;32m'
BLUE='\033[0;34m'
LIGHTPURPLE='\033[1;35m'
BROWN='\033[0;33m'
NC='\033[0m' # No Color

DATE=$(date)
TIME="TIMESTAMP:"
COLON=":"
TOTDATE=$TIME+$DATE+$COLON

title="${BROWN}DIY Linux - Options Menu:${NC}"
prompt="Pick an option (1 to display Menu):"
options=("Install and Configure: DIY Linux Pure Blend and all sets - for amd64 (quiet)" "Install and Configure: DIY Linux Pure Blend and all sets - for i686 (quiet)" "Install and Configure: DIY Linux Pure Blend and official repo sets - for amd64 (quiet)" "Install and Configure: DIY Linux Pure Blend and official repo sets - for i686 (quiet)" "Install and Configure: DIY Linux Pure Blend no sets - for amd64 (quiet)" "Install and Configure: DIY Linux Pure Blend no sets - for i686 (quiet)" "Install and Configure: Set Audio from official repo - for amd64" "Install and Configure: Set Audio from official repo - for amd64 (quiet)"  "Install and Configure: Set Audio from official repo - for i686" "Install and Configure: Set Audio from official repo - for i686 (quiet)" "Install and Configure: Set Audio from unofficial repos - for amd64" "Install and Configure: Set Audio from unofficial repos - for amd64 (quiet)" "Install and Configure: Set Audio from unofficial repos - for i686" "Install and Configure: Set Audio from unofficial repos - for i686 (quiet)" "Install and Configure: Set Desktop from official repo - for amd64" "Install and Configure: Set Desktop from official repo - for amd64 (quiet)" "Install and Configure: Set Desktop from official repo - for i686" "Install and Configure: Set Desktop from official repo - for i686 (quiet)" "Install and Configure: Set Desktop from unofficial repos - for amd64" "Install and Configure: Set Desktop from unofficial repos - for amd64 (quiet)" "Install and Configure: Set Desktop from unofficial repos - for i686" "Install and Configure: Set Desktop from unofficial repos - for i686 (quiet)" "Install and Configure: Set System Security from official repo - for amd64" "Install and Configure: Set System Security from official repo - for amd64 (quiet)" "Install and Configure: Set System Security from official repo - for i686" "Install and Configure: Set System Security from official repo - for i686 (quiet)" "Install and Configure: Set System Security from unofficial repos - for amd64" "Install and Configure: Set System Security from unofficial repos - for amd64 (quiet)" "Install and Configure: Set System Security from unofficial repos - for i686" "Install and Configure: Set System Security from unofficial repos - for i686 (quiet)" "Install and Configure: Set Networking Security from official repo - for amd64" "Install and Configure: Set Networking Security from official repo - for amd64 (quiet)" "Install and Configure: Set Networking Security from official repo - for i686" "Install and Configure: Set Networking Security from official repo - for i686 (quiet)" "Install and Configure: Set Networking Security from unofficial repos - for amd64" "Install and Configure: Set Networking Security from unofficial repos - for amd64 (quiet)" "Install and Configure: Set Networking Security from unofficial repos - for i686" "Install and Configure: Set Networking Security from unofficial repos - for i686 (quiet)" "Install and Configure: Set Minimal Linux Enterprise Cluster Heartbeat & Cloud from official repo - for amd64" "Install and Configure: Set Minimal Linux Enterprise Cluster Heartbeat & Cloud from official repo - for amd64 (quiet)" "Install and Configure: Set Minimal Linux Enterprise Cluster Heartbeat & Cloud from official repo - for i686" "Install and Configure: Set Minimal Linux Enterprise Cluster Heartbeat & Cloud from official repo - for i686 (quiet)" "System Information" "Print logfile.log" "Erase logfile.log" "License" "About")

# Create log file
touch logfile.log | tee -a logfile.log
echo $DATE 2>&1 | tee -a logfile.log
echo -e "$title" 2>&1 | tee -a logfile.log
# PS3="$prompt "
PS3=$(echo -e "${BLUE}$prompt${NC} ")
 select opt in "${options[@]}" "Quit"; do 

    case "$REPLY" in

    1 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
	     rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	
        ;;

    2 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
	     rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	
        ;;

    3 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
	     rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	
        ;;

    4 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
	     rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	
        ;;

    5 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
	     rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	
        ;;

    6 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
	     rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	
        ;;

    7 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
	     rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	
        ;;

    8 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
	     rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	
        ;;

    9 ) echo "Running $opt which is option $REPLY..."
	     bash Set_Audio_from_official_repo_-_for_i686.bash #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
	;;

    10 ) echo "Running $opt which is option $REPLY..."
	     bash Set_Audio_from_official_repo_-_for_i686_quiet.bash #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
	;;
   
    11 ) echo "Running $opt which is option $REPLY..."
             bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    12 ) echo "Running $opt which is option $REPLY..."
             bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    13 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    14 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;
	
    15 ) echo "Running $opt which is option $REPLY..."
             bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    16 ) echo "Running $opt which is option $REPLY..."
             bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    17 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    18 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    19 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    20 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    21 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    22 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    23 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    24 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    25 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    26 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    27 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    28 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    29 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    30 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    31 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    32 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    33 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    34 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    35 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    36 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    37 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    38 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    39 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    40 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    41 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    42 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    43 ) echo "Running $opt which is option $REPLY..."
	     bash include-file.sh #2>&1 | tee -a logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    44 ) echo "Running $opt which is option $REPLY..."
	     echo "logfile.log:$(<logfile.log)"
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    45 ) echo "Running $opt which is option $REPLY..."
	     echo ""> logfile.log
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
        ;;

    46 ) echo "Running $opt which is option $REPLY..."
	     echo "$(<License.txt)"
             rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
	;;

    47 ) echo "Running $opt which is option $REPLY..."
	 echo "DIY Linux Installer"
         echo "Installs and sets up sets of applications to improve a custom GNU/Linux Desktop" 
         echo "Version: 0.0.1. Date: Friday, June 30, 2017"
         echo "Development: Esteban Herrera. E-mail: stv.herrera@gmail.com. Web site: http://liquidsmok.hopto.org"
	;;

    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo -e "${RED}Invalid option. Try another one.${NC}";continue;;

    esac

done


# Basic graphical menu
# Pending: Send logs to notepad output.

#while opt=$(zenity --title="$title" --text="$prompt" --list \
#                   --column="Options" "${options[@]}"); do
#
#    case "$opt" in
#    "${options[0]}" ) zenity --info --text="You picked $opt, option 1";;
#    "${options[1]}" ) zenity --info --text="You picked $opt, option 2";;
#    "${options[2]}" ) zenity --info --text="You picked $opt, option 3";;
#    *) zenity --error --text="Invalid option. Try another one.";;
#    esac
#
#done
