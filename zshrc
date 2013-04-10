#!/bin/zsh

GIT_MERGE_AUTOEDIT=no
export GIT_MERGE_AUTOEDIT
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='tadassce'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(brew bundler extract Forklift gem github git github osx rails3 urltools vi-mode)
# brew: brews (and brew's dirs in front of /usr/bin)
# bundler: bi, bu, be [cmd]
# extract
# Forklift: fl .
# gem: (completion)
# git: g, gl, gp, gca, ga, grh, gdv, ..
# github: gh (completion)
# osx: tab, pfd, pfs, cdf, quick-look, man-preview, trash
# rails3: rc, rdb, rg, rdm, rs
# urltools: urlencode, urldecode

source $ZSH/oh-my-zsh.sh

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin
PATH=$PATH:/usr/X11/bin:/opt/local/bin:/usr/local/mysql/bin
PATH=$PATH:/opt/nginx/sbin
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:/Users/tadas/Dropbox/Dotfiles/bin
PATH=$PATH:./bin

export PATH
export GREP_COLOR=7
export EDITOR=vim

# For tmux-powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Enable rbenv shims and autocompletion:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/.aliases


# search up/down by taking the current line content into account
bindkey -M viins '^[[A' history-beginning-search-backward
bindkey -M viins '^[[B' history-beginning-search-forward
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# go up one dir with <C-u>
bindkey -M viins -s ^U "cd ..\C-m"

precmd(){
  echo -ne "\e]1;${PWD##*/}\a"
}
