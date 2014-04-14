#!/bin/zsh

GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin
PATH=$PATH:/usr/X11/bin:/opt/local/bin:/usr/local/mysql/bin
PATH=$PATH:/opt/nginx/sbin
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:/Users/tadas/Dropbox/Dotfiles/bin
PATH=$PATH:./bin

export PATH
export GREP_COLOR=35
export EDITOR=vim

# Enable rbenv shims and autocompletion:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/.aliases

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
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# search up/down by taking the current line content into account
bindkey -M viins '^[[A' history-beginning-search-backward
bindkey -M viins '^[[B' history-beginning-search-forward
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward


precmd(){
  echo -ne "\e]1;${PWD##*/}\a"
}

disable -r time       # disable shell reserved word
alias time='time -p ' # -p for POSIX output

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Ruby
export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_GC_HEAP_FREE_SLOTS=500000

# Prompt
autoload -U colors && colors
setopt promptsubst
git_br() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  if [[ -n $(git status -s 2> /dev/null) ]]
  then
    echo "%{$fg[magenta]%}${ref#refs/heads/} "
  else
    echo "%{$fg[green]%}${ref#refs/heads/} "
  fi
}
local gitbr='$(git_br)'
local pwd='%{$fg[blue]%}%c%{$reset_color%} '
local last_char='%{$fg[blue]%}%%%{$reset_color%} '
PROMPT="${pwd}${gitbr}${last_char}"

# Case insensitive completions
autoload -U compinit
autoload -U zstyle+
compinit -C
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
