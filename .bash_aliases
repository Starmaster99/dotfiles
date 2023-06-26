alias reload="source $HOME/.bashrc"

alias l="ls --color=auto"
alias ll="ls -la --color=auto"
alias t="tmux attach || tmux new"
alias vpn-on="sudo wg-quick up $HOME/vpn.conf"
alias vpn-off="sudo wg-quick down $HOME/vpn.conf"

alias fuck='sudo "$BASH" -c "$(history -p !!)"'
alias fucking='sudo'
