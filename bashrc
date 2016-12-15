# MAC OSX 10.8.3

echo 1

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

echo 2

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

echo 3

alias ..='cd ..'
alias ls='ls -lhG'
alias tmux='tmux -2'

echo 4

# Java aliases
alias javaclean='rm *.class'

echo 5

# Python aliases
alias pypath="export PYTHONPATH=\`pwd\`"

echo 6

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

echo 7

# Load OSX config
[ -f ~/.osx_config_leo ] && echo "Loading OSX config" && source ${HOME}/.osx_config_leo

echo 8

# Load CERN/CMS config
[ -f ~/.cms_config_leo ] && echo "Loading CMS config" && source ${HOME}/.cms_config_leo

echo 9

# Load JW Player config
[ -f ~/.jw_config_leo ] && echo "Loading JW config" && source ${HOME}/.jw_config_leo
