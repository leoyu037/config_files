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

# Application aliases
alias sublime='open -a /Applications/Sublime\ Text\ 2.app'

# Java aliases
alias javaclean='rm *.class'


# CERN and ROOT aliases
alias cern='ssh -Y lyu@lxplus5.cern.ch'
alias mit='ssh -Y ly037@cgate.mit.edu'
alias root='root -l'
alias rootclean='rm *.so *.d'

##############################################################################
#
#				FUNCTIONS
#
##############################################################################

# Finder functions
function showhiddenfiles()
{
	defaults write com.apple.finder AppleShowAllFiles YES
	killall -HUP Finder
}

function hidehiddenfiles()
{
	defaults write com.apple.finder AppleShowAllFiles NO
	killall -HUP Finder
}

# Android functions
function androidinit()
{
  export PATH=$PATH:~/Programming/Android/adt-bundle-mac-x86_64-20131030/sdk/platform-tools
  echo 'Android platform tools added to PATH'
}

# CERN and ROOT functions
function rootsetup()
{
	# if number of args = 1 and first arg is mount
	if [[ $# > 0 && $1 == 'mount' ]]
		then
			mountcern
	fi

	. ~/Programming/Root/bin/thisroot.sh
	echo "ROOT path set."

	cd ~/Documents/Heavy\ Ion\ Research/Scripts
}

function rootbatch()
{
	root -b -q $1
	rootclean
	echo "Batch operation done."
  ls
}

function mountcern()
{
	mkdir ~/Documents/Heavy\ Ion\ Research/CERN
	sshfs lyu@lxplus.cern.ch:. ~/Documents/Heavy\ Ion\ Research/CERN/
	echo "LXPLUS fs mounted via sshfs."

  export CERN=~/Documents/Heavy\ Ion\ Research/CERN/
  echo "sshfs environment variables set up: \$CERN"
}

function unmountcern()
{
	umount ~/Documents/Heavy\ Ion\ Research/CERN
	rmdir ~/Documents/Heavy\ Ion\ Research/CERN
	echo "Unmounted LXPLUS fs."
}

function mountmit()
{
	mkdir ~/Documents/Heavy\ Ion\ Research/MIT
	sshfs ly037@cgate.mit.edu:. ~/Documents/Heavy\ Ion\ Research/MIT/
	echo "MIT fs mounted via sshfs."

  export MIT=~/Documents/Heavy\ Ion\ Research/MIT/
  echo "sshfs environment variables set up: \$MIT"
}

function unmountmit()
{
	umount ~/Documents/Heavy\ Ion\ Research/MIT
	rmdir ~/Documents/Heavy\ Ion\ Research/MIT
	echo "Unmounted MIT fs."
}

function afsinit()
{
  kinit lyu@CERN.CH
  aklog -c CERN.CH
  echo "AFS ticket setup"

  export CERN=/afs/cern.ch/user/l/lyu/
  export CERNWORK=/afs/cern.ch/work/l/lyu/
  echo "AFS environment variables setup: \$CERN and \$CERNWORK"
}
