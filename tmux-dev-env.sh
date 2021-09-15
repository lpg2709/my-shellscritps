#!/bin/bash

PWD=$(pwd)
DIR=$(echo "${PWD##*/}")
S_NAME=$DIR

# Options
GIT_WINDOW=0

help(){
cat << EOF
Usage: tmux-dev-env.sh [options]

OPTIONS:
  --help    Show this message.
  --git     Start with a window for git.

EOF
}

while (( "$#" )); do
	if [ "$1" == "--git" ]; then
		GIT_WINDOW=1
	fi
	if [ "$1" == "--help" ]; then
		help
		exit
	fi
	shift
done



tmux -u new-session -s $S_NAME -n 'vim' -d
tmux new-window -t $S_NAME -n 'bash'
if [ $GIT_WINDOW -eq 1 ]; then
	tmux new-window -t $S_NAME -n 'git'
fi

tmux send-keys -t $S_NAME:vim "vim" Enter C-b
sleep 0.5
tmux attach-session -t $S_NAME
