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
                        1) check_update; break ;;
                        2) reinstall_theme; break ;;
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
