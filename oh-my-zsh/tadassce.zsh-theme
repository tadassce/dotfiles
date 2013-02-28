#!/bin/zsh
# zsh theme by @tadassce

local user='%{$fg_bold[blue]%}%n@%m'
# local pwd='%{$fg[white]%}[%~]%{$reset_color%}'
# local pwd='%{$fg[blue]%}[%c]%{$reset_color%}'
local pwd='%{$fg[blue]%}%c%{$reset_color%} '
# local git_branch='$(git_prompt_info)'
local last_cmd_status='%(?.%{$fg[blue]%}.%{$fg[red]%})➜%{$reset_color%} '
# local last_char='%{$fg[blue]%}%#%{$reset_color%} '
local last_char='%{$fg[blue]%}➜%{$reset_color%} '

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✘%{$fg[green]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

git_br() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)  || ref=$(git rev-parse --short HEAD 2> /dev/null)  || return
	local SUBMODULE_SYNTAX=''
	if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]
	then
		if [[ $POST_1_7_2_GIT -gt 0 ]]
		then
			SUBMODULE_SYNTAX="--ignore-submodules=dirty"
		fi
		if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]
		then
      echo "%{$fg[magenta]%}${ref#refs/heads/} "
		else
      echo "%{$fg[green]%}${ref#refs/heads/} "
		fi
	fi
}

local git_branch='$(git_br)'

# PROMPT="${pwd}${git_branch}${last_char}"
PROMPT="${pwd}${git_branch}${last_cmd_status}"

# minimal prompt:
# PROMPT="%{$fg[blue]%}⌁%{$reset_color%} "

# %(x.true-text.false-text)
# check this:
# http://www.nparikh.org/unix/prompt.php
