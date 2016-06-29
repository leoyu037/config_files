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
alias ls="ls -lhG --group-directories-first"

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
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}
  %{$fg_bold[red]%}➜%{$reset_color%}  '

# Load JW Player config
[ -f ~/.jw_config_leo ] && source ${HOME}/.jw_config_leo
