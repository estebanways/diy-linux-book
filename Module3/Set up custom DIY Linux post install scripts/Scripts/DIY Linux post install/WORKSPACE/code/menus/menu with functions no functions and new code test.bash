#!/bin/bash
function check_update {
        echo "Checking update"
}

function reinstall_theme {
        echo "Reinstalling theme"
}

all_done=0
while (( !all_done )); do
        options=("Check for update" "Reinstall theme")

        echo "Choose an option:"
        select opt in "${options[@]}"; do
                case $REPLY in
                        1)  echo "Running $opt which is option $REPLY..."
	     		    bash include-file.sh #2>&1 | tee -a logfile.log
	                    rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	; break ;;
                        2)  echo "Running $opt which is option $REPLY..."
	     		    bash include-file.sh #2>&1 | tee -a logfile.log
	                    rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}--- SOMETHING WENT WRONG. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE:${NC}" exit $rc; fi 2>&1 | tee -a logfile.log	; break ;;
                        *) echo "What's that?" ;;
                esac
        done

        echo "Doing other things..."

        echo "Are we done?"
        select opt in "Yes" "No"; do
                case $REPLY in
                        1) all_done=1; break ;;
                        2) break ;;
                        *) echo "Look, it's a simple question..." ;;
                esac
        done
done
