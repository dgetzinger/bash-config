# .bashrc
#
# Sourced by .bash_profile, thus on every interactive shell.


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General variables
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export EDITOR=vim
export VISUAL=$EDITOR

BASH_AUXDIR=.bash.d

# TODO: Debian maintainer name and email definitions


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
export PS1='\n\[\033[38;5;222m\]$(pwd) \[\033[38;5;107m\]\s-\v [$SHLVL] \[\033[38;5;74m\]\t $(date +%Z)\n\[\033[38;5;137m\][\!] \$ \[\033[0m\]'
export PS2='\[\033[38;5;137m\] => \[\033[0m\]'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Aliases
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Colorize ls
if ls --version > /dev/null 2>&1; then
	alias ls='ls --color=auto';		# GNU
else
	alias ls='ls -G';				# OSX
fi

alias ll='ls -al'
alias ..='cd ..'
alias hist='history | grep $1'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Personal info (name, email, etc.)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
persinfofile="$BASH_AUXDIR/personal_info"
if [ -r "$persinfofile" ]; then source $persinfofile; fi


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Expose proxy functions 'proxyon' and 'proxyoff' when on corporate
# network.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
proxyfuncfile="$BASH_AUXDIR/proxyfuncs"
if [ -r "$proxyfuncfile" ]; then source $proxyfuncfile; fi

# assume proxy
proxyon
