#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\n\[\e[0m\]\w\n\[\e[0m\]$ \[\e[0m\]'
