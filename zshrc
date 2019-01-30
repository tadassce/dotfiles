#!/bin/zsh

GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
PATH=$PATH:/usr/local/git/bin
PATH=$PATH:/usr/local/heroku/bin
PATH=$PATH:~/.dotfiles/bin

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
setopt interactivecomments

# search up/down by taking the current line content into account
bindkey -M viins '^[[A' history-beginning-search-backward
bindkey -M viins '^[[B' history-beginning-search-forward
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# Incremental search
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward
bindkey -M viins '^p' history-incremental-pattern-search-backward
bindkey -M viins '^n' history-incremental-pattern-search-forward

# Edit line in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

disable -r time       # disable shell reserved word
alias time='time -p ' # -p for POSIX output

bindkey -M vicmd 'u' undo

source ~/.completions
source ~/.prompt
source ~/.aliases
source ~/.private_aliases
source ~/.functions
source ~/.fzfrc

# load custom functions
for function in ~/.zsh/functions/*; do
  source $function
done

# chruby (if present)
if [ -d /usr/local/opt/chruby ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi
