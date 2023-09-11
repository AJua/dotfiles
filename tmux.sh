#!/bin/sh

# Set Session Name
SESSION="Website"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Name first Pane and start zsh
    tmux rename-window -t 0 'vimwiki'
    tmux send-keys -t 'vimwiki' 'vim' C-m 
    tmux send-keys -t 'vimwiki' ',ww' C-m 

    # Create and setup pane for hugo server
    tmux new-window -t $SESSION:1 -n 'appium'
    tmux send-keys -t 'appium' 'appium' C-m # Switch to bind script?

    # setup Writing window
    tmux new-window -t $SESSION:2 -n 'scrcpy'

    # Setup an additional shell
    tmux new-window -t $SESSION:3 -n 'lnav'
    tmux send-keys -t 'lnav' "cd ~/development/sbo_app" C-m

    # Setup an additional shell
    tmux new-window -t $SESSION:4 -n 'flutter run'
    tmux send-keys -t 'flutter run' "cd ~/development/sbo_app" C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
