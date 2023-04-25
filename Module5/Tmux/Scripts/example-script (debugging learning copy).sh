#!/bin/bash
# example-script.sh
# Make the script executable:
# $ chmod +x example-script.sh
# Run the tmux script:
# $ ./example-script.sh
# Enter the tmux session:
# $ tmux list-sessions
# $ tmux attach -t EvilTwin-0
# Kill the session:
# $ tmux kill session -t EvilTwin-0
# To display the pane numbers:
# In the tmux session, press CTRL+B, release and then press q

# Gives .5 seconds to tmux to draw the pane and its content before continue
tiempo=0.5

# Creates a new sessions, detaches from it to continue and sleeps
tmux new-session -d -t "EvilTwin" && sleep $tiempo
# Renames the tmux window, splits it horizontally, and set focus the cursor on the pane number 1
tmux rename-window "flush" && tmux split-window -h && tmux select-pane -t 1
# Runs iptables commands to the focused pane, presses enter key using the C-m parameter, and sleeps
tmux send-keys "iptables --flush" C-m && sleep $tiempo
tmux send-keys "iptables --table nat --flush" C-m && sleep $tiempo
tmux send-keys "iptables --delete-chain" C-m && sleep $tiempo
tmux send-keys "iptables --table nat --delete-chain" C-m && sleep $tiempo
#------------------------------------------------------------------------------
# Selects the pane 2, runs an iptables command, send enter key, presses enter, and sleeps
tmux select-pane -t 2 && tmux send-keys "iptables -L" C-m && sleep $tiempo
#------------------------------------------------------------------------------
# Creates a new tmux window 2, name it "passwd", sleeps,runs the command cat file, sends enter key, and sleeps
tmux new window -t EvilTwin:2 -n "passwd" && sleep $tiempo && tmux send-keys "cat /etc/passwd" C-m && sleep $tiempo
# Focus the cursos on the window 1 ("flush")
tmux select-window -t 1

