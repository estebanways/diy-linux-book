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
#
# reset

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

title="${BROWN}DIY Linux Shell - Menu${NC}"

function log_error {
        rc=$?; if [[ $rc != 0 ]]; then echo -e "$DATE --- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ${RED}ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log
}

function running_option {
        echo "Running $opt which is option: $REPLY..."
}

all_done=0
while (( !all_done )); do
        options=("Add sections contrib and non-free to sources.list" "Update sources in /etc/apt/" "Install and Configure: DIY Linux Pure Blend and all sets - for amd64 (quiet)" "Install and Configure: DIY Linux Pure Blend and all sets - for i686 (quiet)" "Install and Configure: DIY Linux Pure Blend and official repo sets - for amd64 (quiet)" "Install and Configure: DIY Linux Pure Blend and official repo sets - for i686 (quiet)" "Install and Configure: DIY Linux Pure Blend no sets - for amd64 (quiet)" "Install and Configure: DIY Linux Pure Blend no sets - for i686 (quiet)" "Install and Configure: Set Audio from official repo - for amd64" "Install and Configure: Set Audio from official repo - for amd64 (quiet)"  "Install and Configure: Set Audio from official repo - for i686" "Install and Configure: Set Audio from official repo - for i686 (quiet)" "Install and Configure: Set Audio from unofficial repos - for amd64" "Install and Configure: Set Audio from unofficial repos - for amd64 (quiet)" "Install and Configure: Set Audio from unofficial repos - for i686" "Install and Configure: Set Audio from unofficial repos - for i686 (quiet)" "Install and Configure: Set Desktop from official repo - for amd64" "Install and Configure: Set Desktop from official repo - for amd64 (quiet)" "Install and Configure: Set Desktop from official repo - for i686" "Install and Configure: Set Desktop from official repo - for i686 (quiet)" "Install and Configure: Set Desktop from unofficial repos - for amd64" "Install and Configure: Set Desktop from unofficial repos - for amd64 (quiet)" "Install and Configure: Set Desktop from unofficial repos - for i686" "Install and Configure: Set Desktop from unofficial repos - for i686 (quiet)" "Install and Configure: Set System Security from official repo - for amd64" "Install and Configure: Set System Security from official repo - for amd64 (quiet)" "Install and Configure: Set System Security from official repo - for i686" "Install and Configure: Set System Security from official repo - for i686 (quiet)" "Install and Configure: Set System Security from unofficial repos - for amd64" "Install and Configure: Set System Security from unofficial repos - for amd64 (quiet)" "Install and Configure: Set System Security from unofficial repos - for i686" "Install and Configure: Set System Security from unofficial repos - for i686 (quiet)" "Install and Configure: Set Networking Security from official repo - for amd64" "Install and Configure: Set Networking Security from official repo - for amd64 (quiet)" "Install and Configure: Set Networking Security from official repo - for i686" "Install and Configure: Set Networking Security from official repo - for i686 (quiet)" "Install and Configure: Set Networking Security from unofficial repos - for amd64" "Install and Configure: Set Networking Security from unofficial repos - for amd64 (quiet)" "Install and Configure: Set Networking Security from unofficial repos - for i686" "Install and Configure: Set Networking Security from unofficial repos - for i686 (quiet)" "Install and Configure: Set Minimal Linux Enterprise Cluster Heartbeat & Cloud from official repo - for amd64" "Install and Configure: Set Minimal Linux Enterprise Cluster Heartbeat & Cloud from official repo - for amd64 (quiet)" "Install and Configure: Set Minimal Linux Enterprise Cluster Heartbeat & Cloud from official repo - for i686" "Install and Configure: Set Minimal Linux Enterprise Cluster Heartbeat & Cloud from official repo - for i686 (quiet)" "Display dependency conflicts" "Print logfile.log" "Erase logfile.log" "License" "About")

	# Create log file
	touch logfile.log | tee -a logfile.log

	#echo -e "$title"
	#echo "$(tput setaf 1)Red text $(tput setab 7)and white background$(tput sgr 0)"
	echo "$(tput setaf 1)$(tput setab 7) DIY Linux Shell - Menu $(tput sgr 0)"
echo -e "${BLUE}Choose an option:${NC}"

        select opt in "${options[@]}"; do
                case $REPLY in
                         1 ) running_option;
	     		     nano /etc/apt/sources.list
	                     log_error; break ;;
                         2 ) running_option;
	                     bash Update_sources_in_etc_apt.bash
	                     log_error; break ;;
                         3 ) running_option;
	                     bash include-file.sh
	                     log_error; break ;;
    			 4 ) running_option;
	     		     bash include-file.sh
	     		     log_error; break ;;
    		   	 5 ) running_option;
	     		     bash include-file.sh
	     		     log_error; break ;;
    			 6 ) running_option;
	     		     bash include-file.sh
	     		     log_error; break ;;
    			 7 ) running_option;
	                     bash include-file.sh
	                     log_error; break ;;
    			 8 ) running_option;
	                     bash include-file.sh
	                     log_error; break ;;
    			 9 ) running_option;
	     		     bash include-file.sh
             		     log_error; break ;;
		        10 ) running_option;
	                     bash include-file.sh
		             log_error; break ;;
			11 ) running_option;
		             bash Set_Audio_from_official_repo_-_for_i686.bash
		             log_error; break ;;
			12 ) running_option;
		             bash Set_Audio_from_official_repo_-_for_i686_quiet.bash
		             log_error; break ;;
			13 ) running_option;
	     		     bash include-file.sh
	     		     log_error; break ;;
			14 ) running_option;
		             bash include-file.sh
	     		     log_error; break ;;
			15 ) running_option;
		             bash include-file.sh
	     		     log_error; break ;;
			16 ) running_option;
		             bash include-file.sh
		             log_error; break ;;
		        17 ) running_option;
		             bash include-file.sh
	     		     log_error; break ;;
			18 ) running_option;
			     bash include-file.sh
			     log_error; break ;;
			19 ) running_option;
			     bash include-file.sh
	     		     log_error; break ;;
			20 ) running_option;
	     		     bash include-file.sh
			     log_error; break ;;
			21 ) running_option;
	     		     bash include-file.sh
		             log_error; break ;;
			22 ) running_option;
	     		     bash include-file.sh
			     log_error; break ;;
			23 ) running_option;
	     		     bash include-file.sh
	     		     log_error; break ;;
			24 ) running_option;
	     		     bash include-file.sh
			     log_error; break ;;
			25 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			26 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			27 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			28 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			29 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			30 ) running_option;
	     	  	     bash include-file.sh
	     	             log_error; break ;;
			31 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			32 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			33 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			34 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			35 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			36 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			37 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			38 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			39 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			40 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			41 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			42 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			43 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			44 ) running_option;
	     		     bash include-file.sh
	     	             log_error; break ;;
			45 ) running_option;
	     		     cat logfile.log | grep "Conflicts"
	     	             log_error; break ;;
			46 ) running_option;
			     echo "logfile.log:$(<logfile.log)"
			     log_error; break ;;
			47 ) running_option;
	     		     echo ""> logfile.log
	     		     log_error; break ;;
			48 ) running_option;
	     		     echo "$(<License.txt)"
	     		     log_error; break ;;
			49 ) running_option;
			     echo "DIY Linux post install"
			     echo "Installs and sets up sets of applications to improve a custom GNU/Linux" 
			     echo "Version: 0.0.1. Date: Friday, June 30, 2017"
			     echo "Development: Esteban Herrera. E-mail: stv.herrera@gmail.com"
			     echo "Web site: http://liquidsmok.hopto.org" ; break ;;

			#$(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
			 *) echo -e "${BLUE}Invalid option. Try another one.${NC}";continue;;
                esac
        done

        #echo "Doing other things..."

        echo -e "${BLUE}Are we done?${NC}"
        select opt in "Yes" "No"; do
                case $REPLY in
                        1) all_done=1; break ;;
                        2) break ;;
                        *) echo -e "${BLUE}Look, it's a simple question...${NC}" ;;
                esac
        done
done

