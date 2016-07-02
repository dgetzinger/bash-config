# .bashrc
#
# sourced by .bash_profile, thus on every interactive shell.


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# source scripts from .bash.d
# Do this before setting prompt as non-interactive shells may rely on
# variables and functions defined in sourced scripts.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bash_auxdir=.bash.d

# Source all shell scripts found in auxiliary directory except those
# whose names start with an underscore
for script in "$bash_auxdir"/[^_]*.sh; do
	if [ -r "$script" ]; then source $script; else true; fi
done


if [ -z "$PS1" ]; then return; fi

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Everything from here down applies only to interactive shells.
# You can test either $PS1 (unset for non-interactive shells) or $1
# (set to "i" for interactive shells).
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General variables
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set -o vi
export EDITOR=vim
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
export PS1='\n\[\033[38;5;222m\]$(date +"%a %b %d %T %Z") \[\033[38;5;107m\]$(pwd) \[\033[38;5;74m\]\s-\v [$SHLVL]
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
