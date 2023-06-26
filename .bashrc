#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\n\[\e[0m\]\w\n\[\e[0m\]$ \[\e[0m\]'

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

export TERM=xterm-256color
