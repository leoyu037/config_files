# MAC OSX 10.8.3

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# bash prompt
[ -f ~/.bash_prompt ] && . ${HOME}/.bash_prompt

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

alias ..='cd ..'
alias ls='ls -lhG'
alias tmux='tmux -2'

# Java aliases
alias javaclean='rm *.class'

# Python aliases
alias pypath="export PYTHONPATH=\`pwd\`"

# Digital Ocean server
alias doserver='ssh root@45.55.170.64'

##############################################################################
#
#				FUNCTIONS
#
##############################################################################

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
[ -f ~/.jw_config_leo ] && echo "Loading JW config" && source ${HOME}/.jw_config_leo
