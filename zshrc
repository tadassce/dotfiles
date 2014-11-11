#!/bin/zsh

GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin
PATH=$PATH:/usr/local/heroku/bin
PATH=$PATH:/usr/X11/bin:/opt/local/bin:/usr/local/mysql/bin
PATH=$PATH:/opt/nginx/sbin
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:/Users/tadas/Dot/bin
PATH=$PATH:./bin

export PATH
export GREP_OPTIONS='--color=auto'
export GREP_COLOR=35
export EDITOR=vim

# History
if [ -z $HISTFILE ]; then
  HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# search up/down by taking the current line content into account
bindkey -M viins '^[[A' history-beginning-search-backward
bindkey -M viins '^[[B' history-beginning-search-forward
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# Incremental search
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

disable -r time       # disable shell reserved word
alias time='time -p ' # -p for POSIX output

bindkey -M vicmd 'u' undo

source ~/.completions
source ~/.prompt
source ~/.aliases

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.1.4

# Ruby
export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_GC_HEAP_FREE_SLOTS=500000

# Homebrew Cask default path, at least while the PR is open:
# https://github.com/caskroom/homebrew-cask/issues/2534
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Docker
export DOCKER_HOST=tcp://192.168.59.103:2375
