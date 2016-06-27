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

alias ls='ls -lhG'
alias tmux='tmux -2'

# Java aliases
alias javaclean='rm *.class'

# Python aliases
alias pypath="export PYTHONPATH=\`pwd\`"

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
[ -f ~/.osx_config_leo ] && source ${HOME}/.osx_config_leo

# Load CERN/CMS config
[ -f ~/.cms_config_leo ] && source ${HOME}/.cms_config_leo

# Load JW Player config
[ -f ~/.jw_config_leo ] && source ${HOME}/.jw_config_leo
