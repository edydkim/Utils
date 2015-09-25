#!/bin/bash

# color names for readibility
reset=$(tput sgr0)
bold=$(tput bold)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
user_color=$magenta
[ "$UID" -eq 0 ] && { user_color=$red; }
PS1="\[$reset\][\[$cyan\]\A\[$reset\]]\[$bold$user_color\]\u@\h(\l)\
\[$white\]:\[$blue\]\W\[$reset\][\[$yellow\]\$?\[$reset\]]\[$white\]\
\\$\[$reset\] "

alias ll="ls -altr"
