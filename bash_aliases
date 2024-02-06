# ~/.bashrc: executed by bash(1) for non-login shells.

alias nf='nvim $(fdfind --hidden| fzf)'
alias nv='nvim .'
alias cf='nvim ~/.config/nvim'
alias f='cd $(fdfind --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf --reverse --height 40%)'


# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  # exec tmux
# fi
