#!/bin/zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GIT_MERGE_AUTOEDIT=no

if [[ `uname -s` == 'Darwin' ]]; then
  export BREW_PREFIX=/opt/homebrew
  PATH=$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH:~/.local/bin:~/.bin
  source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ $SPIN ]; then
  spin_zshrc='/etc/zsh/zshrc.default.inc.zsh'
  [[ -e "$spin_zshrc" ]] && source "$spin_zshrc"
fi

export PATH
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
bindkey -v

disable -r time       # disable shell reserved word
alias time='time -p ' # -p for POSIX output

bindkey -M vicmd 'u' undo

# load custom functions
source ~/.functions
for function in ~/.zsh/functions/*; do
  source $function
done

source ~/.completions
source ~/.aliases
source ~/.private_profile
source ~/.prompt
source ~/.fzfrc
