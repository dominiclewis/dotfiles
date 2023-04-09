# Make zsh perform more like bash
bindkey -e

# Env
export EDITOR=$(which vim)

# Aliases
alias ll="ls -al"
alias hist="history 1"
alias tf=terraform

# TMUX
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [[ "$TERM_PROGRAM" != "vscode" ]] ; then
    tmux attach -t default || tmux new -s default
fi
