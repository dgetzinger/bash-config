# myip.sh
#
# Defines function myip that retrieves the user's public ip from
# myip.opendns.com using dig


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Function definition
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
myip () {
	if dig +short myip.opendns.com @resolver1.opendns.com; then return;
	elif curl -s -m 3 4.ifcfg.me; then return;		# timeout 5 secs
	elif curl -s -m 3 icanhazip.com; then return;	# timeout 5 secs
	fi
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Aliases
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias wanip='myip'
alias whatsmyip='myip'
alias showmyip='myip'
