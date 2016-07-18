##############################################################################
#
#				Oh My Zsh!
#
##############################################################################

export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=14
export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

##############################################################################
#
#				ALIASES
#
##############################################################################

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="ls -lhGp --group-directories-first"

# Python
alias pypath="export PYTHONPATH=\`pwd\`"

# Digital Ocean Server
alias doserver='ssh root@45.55.170.64'

##############################################################################
#
#				FUNCTIONS
#
##############################################################################

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# Prompt
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}
  %{$fg_bold[red]%}➜%{$reset_color%} $(git_prompt_info) ${ret_status} '

##############################################################################
#
#				LOAD CONFIGS
#
##############################################################################

# Load OSX config
[ -f ~/.osx_config_leo ] && echo "Loading OSX config" && source ${HOME}/.osx_config_leo

# Load CERN/CMS config
[ -f ~/.cms_config_leo ] && echo "Loading CMS config" && source ${HOME}/.cms_config_leo

# Load JW Player config
[ -f ~/.jw_config_leo ] && echo "Loading JW Config" && source ${HOME}/.jw_config_leo
