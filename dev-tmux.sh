#!/bin/bash

PWD=$(pwd)
DIR=$(echo "${PWD##*/}")
S_NAME="dev"

tmux -c new-session -s $S_NAME -n 'vim' -d 'vim'
tmux new-window -t $S_NAME -n 'bash'
tmux new-window -t $S_NAME -n 'git'
sleep 0.1 # try fix rendering error with NerdTree
tmux a -t $S_NAME
