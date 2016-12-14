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

alias findfile="find . -name"
alias ls="ls -lhGp --group-directories-first" # Linux
# alias ls="ls -lhGp" # OSX
alias reload=". ~/.zshrc"
alias resethosts="mv ~/.ssh/known_hosts ~/.ssh/known_hosts.bak"

# Python
alias pypath="export PYTHONPATH=\`pwd\`"

# Digital Ocean Server
alias doserver='ssh root@45.55.170.64'

##############################################################################
#
#				FUNCTIONS
#
##############################################################################

function docker_bash {
    docker run -it $1 /bin/bash
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function findinfile {
    if [[ ($# -lt 1) || ($1 = '-h') ]]; then
      echo 'usage: findinfile [-h]|[<file_pattern> <target_string>]'
    else
      grep --include=$1 -rn . -e $2
    fi
}

# Prompt
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}
  $(git_prompt_info)%{$fg_bold[red]%}➜%{$reset_color%}  '

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
