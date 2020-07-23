# If not running interactively, don't do anything
[[ $- == *i* ]] || return

##############################################################################
#
#				Oh My Zsh!
#
##############################################################################

export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=14
export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_THEME="robbyrussell"
# COMPLETION_WAITING_DOTS="true"
plugins=(git docker)

source $ZSH/oh-my-zsh.sh
compinit

##############################################################################
#
#				ENVIRONMENTAL VARIABLES
#
##############################################################################

##############################################################################
#
#				ALIASES
#
##############################################################################

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias reload=". ~/.zshrc"

##############################################################################
#
#				FUNCTIONS
#
##############################################################################

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

##############################################################################
#
#				SCRIPTS
#
##############################################################################

# Prompt
local user='%{$fg[magenta]%}%n%{$reset_color%}'
local host='%{$fg[yellow]%}%m%{$reset_color%}'
local directory='%{$fg[green]%}$(collapse_pwd)%{$reset_color%}'
local git_status='$(git_prompt_info)'
local arrow='%{$fg_bold[red]%}➜%{$reset_color%}'
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
export PROMPT="$user at $host in $directory
  $git_status$arrow  "

##############################################################################
#
#				LOAD CONFIGS
#
##############################################################################

# Load common config
[ -f ~/.commonrc ] && echo "Loading common config" && source ${HOME}/.commonrc
