#!/bin/zsh

# ==========
# Load others if present
# ==========

[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"


# ==========
# Extend `$PATH`
# ==========

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"


# ==========
# Additional env vars
# ==========

# optionally use .env for variables that shouldn't be committed
[ -f ~/.env ] && source ~/.env


# ==========
# Dotfiles
# ==========

# Load the shell dotfiles, and then some:
[ -f ~/.aliases ] && source ~/.aliases


# ==========
# Prompt
# ==========

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ':%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%F{blue}%1~%b%f${vcs_info_msg_0_} %F{magenta}→ %f'


# ==========
# Autocompletion
# ==========

# brew autocompletion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

# Case-insensitive autocompletion
# https://stackoverflow.com/a/24237590/2122060
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# ==========
# History
# ==========

# set history file in case it defaults to some other value
HISTFILE=~/.zsh_history

# take currently typed string into account when iterating through history
bindkey "\e[A" history-search-backward
bindkey "\e[B" history-search-forward

# all tabs write to same history
setopt INC_APPEND_HISTORY

# Up/down arrows ignore duplicate entries
setopt HIST_FIND_NO_DUPS

# Consecutive duplicates are not added to history
setopt HIST_IGNORE_DUPS
