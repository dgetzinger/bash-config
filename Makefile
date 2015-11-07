# Makefile
#
# Copies specified bash configuration files from development directory
# to bash root directory.
#
# bash root defaults to $HOME; execute 'make BASHROOT=/blah' for
# different destination.


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Variables
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Simple variables: assigned at first encounter
BASHROOT		?= $(HOME)
pubfile_list	:= .bash_profile .bashrc .bash_logout
pvtfile_list 	:= proxyfuncs personal_info
subdirname		:= .bash.d
restore_suffix	:= .orig
subdir			:= $(BASHROOT)/$(subdirname)
pubfiles		:= $(addprefix $(BASHROOT)/,$(pubfile_list))
pvtfiles		:= $(addprefix $(subdir)/,$(pvtfile_list))
allfiles		:= $(pubfiles) $(pvtfiles)
alldirs			:= $(BASHROOT) $(subdir)
BIN				:= /bin
MKDIR			:= $(BIN)/mkdir -p
CP				:= $(BIN)/cp -r
MV				:= $(BIN)/mv
RM				:= $(BIN)/rm -f


# Recursive variables - reevaluated at each encounter
# Suffix generates iso-like timestamp suffix,
# e.g., -20151102083215.bak
backup_suffix 	= -$(shell date --utc +%Y%m%d%H%M%S).bak


# Set SKIPBACKUP to non-empty value to skip making restorable backups
SKIPBACKUP	?=


# For debugging
# Unset QUIET to echo commands
# Set TMPBACKUP to make timestamped backups each time make is run
QUIET		?= @
TMPBACKUP	?= 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Default target
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.PHONY: install
install: $(alldirs) $(allfiles)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Other targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.PHONY: backup restore clean cleanall help


# If any preexisting config files are found that would be overwritten,
# rename those files.
#
# Skip this step if the variable SKIPBACKUP is defined and non-empty.
backup:
ifeq "$(strip ${SKIPBACKUP})" ""
	$(QUIET)for file in $(pubfiles) $(pvtfiles); do \
		if [ -f "$${file}" ]; then	\
			[ -f "$${file}$(restore_suffix)" ] || $(CP) $${file} $${file}$(restore_suffix); \
		else true;	\
		fi;	\
	done
else
	$(QUIET):
$(warning pass)
endif


restore:
	$(QUIET)for file in $(addsuffix $(restore_suffix),$(addprefix $(BASHROOT)/,$(pubfile_list))); do \
		[ -f "$$file" ] && $(MV) $$file $${file%.*}; \
	done


# Remove any timestamped backup files created by this makefile.
clean:
	$(QUIET)for file in $(addsuffix *.bak,$(allfiles)); do \
		if [ -f "$${file}" ]; then $(RM) "$${file}"; fi \
	done


cleanall: clean restore


#TODO: add 'help' target that prints out usage instructions


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Explicit rules.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$(BASHROOT)/%: backup %
ifneq "$(strip ${TMPBACKUP})" ""
	$(QUIET)if [ -f "$@" ]; then \
		$(MV) $@ $@$(backup_suffix); \
	fi
endif
	$(QUIET)$(CP) $* $@ 


$(alldirs):
	$(QUIET)if [ ! -d "$@" ]; then $(MKDIR) "$@"; fi


# Print values of variables specified on print line (debugging)
print-%: ; $(QUIET)echo $* = \'$($*)\'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# More rules
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.PHONY: eyes love whoopee money
eyes:			; $(QUIET)echo "Got a date tonight yet, sailor?"
love whoopee:	; $(QUIET)echo "Not until we're married, Buster."
money:			; $(QUIET)echo "Whaddya got to sell?"

.DEFAULT:
	$(QUIET)echo "I'm not comfortable with that on the first date."
