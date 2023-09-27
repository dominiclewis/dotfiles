# Make zsh perform more like bash
bindkey -e

# History File Setup
HISTFILE=~/.zsh_history
# Set the maximum number of commands in the in-memory history list
HISTSIZE=1000
# Set the maximum number of commands saved to the history file
SAVEHIST=10000
# Append to it instead of Overwriting
setopt INC_APPEND_HISTORY

# Env
export EDITOR=$(which vim)

# Aliases
alias ll="ls -al"
alias hist="history 1"
alias tf=terraform

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Copilot CLIS
if command -v github-copilot-cli; then
    eval "$(github-copilot-cli alias -- "$0")"
fi

# TMUX
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [[ "$TERM_PROGRAM" != "vscode" ]] ; then
    tmux attach -t default || tmux new -s default
fi
