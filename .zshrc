#!/bin/zsh


# ==========
# extend `$PATH`
# ==========

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"


# ==========
# SigSci stuff
# ==========

# extend `$PATH` some more
export GOPATH=/Users/ali/go
export PATH=${GOPATH}/bin:$PATH
export PATH=/usr/local/opt/node@8/bin:$PATH
export PATH="$HOME/.okta/bin:$PATH"

# OktaAWSCLI
# copy the .okta/ dir from old env for this to work
[ -f ~/.okta/bash_functions ] && . ~/.okta/bash_functions


# ==========
# Dotfiles
# ==========

# Load the shell dotfiles, and then some:
[ -f ~/.aliases ] && source ~/.aliases

# run `brew install bash-completion` for this to work
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

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
# brew autocompletion
# ==========

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi
