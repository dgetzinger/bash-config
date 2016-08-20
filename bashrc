#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#  Name:	bashrc - bash runtime control fle
#
#  Author:	David C. Getzinger
#  		<dgetzinger_NOSPAM_777@gmail.com> (delete "_NOSPAM_")
#
#  Date:	Saturday August 20, 2016 20:23:04 HKT
#
#  Version:	v0.9
#
#  License:
#
#  NOTES:	File sourced by .bash_profile, thus by interactive and
# 		non-interactive shells on OSX and Linux.
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ensure homebrew directory is in the path
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
brew_dir="/usr/local/bin"
export PATH=${brew_dir}:$PATH


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# source scripts from .bash.d, skipping files prefixed with an
# underscore ('_')
#
# for git-completion.sh see https://github.com/markgandolfo/git-bash-completion.git
#   (resuffixed here to ".sh" for autosourcing)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bash_auxdir=.bash.d

for script in "$bash_auxdir"/[^_]*.sh; do
	if [ -r "$script" ]; then source $script; else true; fi
done



# Exit here if not an interactive shell
if [ -z "$PS1" ]; then return; fi



#######################################################################
# Everything from here down applies only to interactive shells.
# You can test either $PS1 (unset for non-interactive shells) or $1
# (set to "i" for interactive shells).
#######################################################################


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General variables
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -o vi
export EDITOR=mvim
export VISUAL=$EDITOR


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Prompt customization and colorization.
#
# Enclose definitions in single quotes (') to force dynamic
# interpolation of variables.
#
# Useful colors:
#   250	white
#   222	beige
#   107 soft green
#   156	light green
#   101	olive
#    74 cyan
#    24 blue
#   130	rust
#   183	lavender
#
# \[\033[0m\] resets the fg color to the default setting
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export PS_datetimefmt='%a %b %d %T %Z'

export PS1='\n\[\033[38;5;222m\]$(pwd) \[\033[38;5;107m\]$(date +"$PS_datetimefmt") \[\033[38;5;74m\]\s-\v [$SHLVL]
\[\033[38;5;137m\][\!] \$ \[\033[0m\]'
export PS2='\[\033[38;5;137m\] => \[\033[0m\]'
export PS3='\[\033[38;5;137m\] => \[\033[0m\]'
export PS4='\[\033[38;5;137m\] => \[\033[0m\]'


# Colorize ls
if ls --version > /dev/null 2>&1; then
	alias ls='ls --color=auto';		# GNU
else
	alias ls='ls -G';				# OSX
fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Aliases
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias ll='ls -al'
alias ..='cd ..'
alias hist='history | grep $1'



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# pyenv configuration
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export PYENV_ROOT=/usr/local/var/pyenv
export PATH=PYENV_ROOT/bin:$PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

