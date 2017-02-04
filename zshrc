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
plugins=(git docker)

source $ZSH/oh-my-zsh.sh

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

# Prompt
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}
  $(git_prompt_info)%{$fg_bold[red]%}➜%{$reset_color%}  '

##############################################################################
#
#				LOAD CONFIGS
#
##############################################################################

# Load common config
[ -f ~/.commonrc ] && echo "Loading common config" && source ${HOME}/.commonrc
