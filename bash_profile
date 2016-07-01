# .bash_profile
#
# Sourced on all shells on Mac and on interactive non-login shells on Linux.
# Only function here is to source .bashrc.

BASHRC="$HOME/.bashrc"

if [ -r "$BASHRC" ]; then source $BASHRC; fi
