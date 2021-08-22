#!/bin/bash

PWD=$(pwd)
DIR=$(echo "${PWD##*/}")
S_NAME="dev"

tmux new-session -s $S_NAME -n 'vim' -d 'vim'
tmux new-window -t $S_NAME -n 'bash'
tmux new-window -t $S_NAME -n 'git'
tmux attach-session -t $S_NAME
