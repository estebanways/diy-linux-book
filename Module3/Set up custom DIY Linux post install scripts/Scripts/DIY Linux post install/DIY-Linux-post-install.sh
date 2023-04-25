#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#   Esteban Herrera <stv.herrera@gmail.com>. Web: http://liquidsmok.hopto.org
#
# Description:
#   A post-installation bash script for Debian
#
# Legal Preamble:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

# DEBUGGING:
# reset
# bash -x script.bash
#

# tab width
tabs 4
clear

#----- Import Functions -----#

dir="$(dirname "$0")"

. $dir/functions/check
. $dir/functions/sys-info
. $dir/functions/backup-sources
. $dir/functions/repo-sections
. $dir/functions/apt-update
. $dir/functions/search-apps
. $dir/functions/show-app
. $dir/functions/diy-linux-post
. $dir/functions/update-sys
. $dir/functions/aptitude
. $dir/functions/disp-about

#----- Fancy Messages -----#
show_error(){
echo -e "\033[1;31m$@\033[m" 1>&2
}
show_info(){
echo -e "\033[1;32m$@\033[0m"
}
show_warning(){
echo -e "\033[1;33m$@\033[0m"
}
show_question(){
echo -e "\033[1;34m$@\033[0m"
}
show_success(){
echo -e "\033[1;35m$@\033[0m"
}
show_header(){
echo -e "\033[1;36m$@\033[0m"
}
show_listitem(){
echo -e "\033[0;37m$@\033[0m"
}

# Main
function main {
	eval `resize`
	MAIN=$(whiptail \
		--notags \
		--title "DIY Linux Post-Install" \
		--menu "\nWhat would you like to do?" \
		--cancel-button "Quit" \
		$LINES $COLUMNS $(( $LINES - 12 )) \
		sys-info	        'Verify System information' \
        backup-sources      'Backup file /etc/apt/sources.list' \
		repo-sections		'Add contrib and non-free on sources.list' \
		apt-update          'Update sources in /etc/apt/' \
		diy-linux-post      'Install DIY Linux Post-Install' \
        update-sys          'Update System and "auto-update-able" apps' \
        aptitude            'Aptitude package manager' \
		disp-about	        'About' \
		3>&1 1>&2 2>&3)
	 
	exitstatus=$?
	if [ $exitstatus = 0 ]; then
		$MAIN
	else
		quit
	fi
}

# Quit
function quit {
	if (whiptail --title "Quit" --yesno "Are you sure you want quit?" 10 60) then
		echo "Exiting..."
		show_info 'Thanks for using!'
		exit 99
	else
		main
	fi
}

#RUN
check_dependencies
while :
do
  main
done

#END OF SCRIPT
