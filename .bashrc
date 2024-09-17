# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

PS1='\n\[\e[32m\]\w\n\[\e[0m\]$ \[\e[0m\]'

export TERM=xterm-256color

# Automatically start tmux if not already in a session
if command -v tmux >/dev/null 2>&1; then
    # Check if we're not already inside a tmux session
    if [ -z "$TMUX" ]; then
        # Start tmux, either reattach to an existing session or create a new one
        tmux attach-session -t 0 || tmux new-session -s 0
    fi
fi

export PATH=/usr/local/cuda-12.6/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64
