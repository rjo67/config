#!/bin/bash

# a set of bash functions to store various directories
# and jump to them in an easy manner.
#
# Usage:
#	cds		 - save the current directory to the list
#	go <n>	 - cd to the nth entry in the list
#	cdd <n>	 - delete the nth entry in the list
#
# Pressing go <tab> or cdd <tab> will pull up the current list.
#

FILE=~/.cdlist

# save current directory in $FILE
cds() {
	echo $(pwd) >> $FILE
	echo "saved to $FILE"
}

# delete the required entry from $FILE
cdd() {
	if [ -z "$1" ]; then
		echo "Usage: cdd <n>"
		return 1
	fi
	$(sed --in-place -e ${1}d $FILE)
	echo "deleted"
}

# 'cd' to the directory on line $1 of $FILE
go() {
	# use appropriate line of file
	[ -z "$1" ] && { echo "Usage: go <n>"; return 1; }

	[ ! -e $FILE ] && touch $FILE
	DIR=$(__get_file_line $1)
	[ "$DIR" == "ERROR" ] && { echo "invalid parameter"; return 2; }

	cd "$DIR"
}

# returns the number of lines in the file $1
__nbr_lines_in_file() {
	L=$(sed -n '$=' $1)
	echo $L
}

# return required line of file
# or ERROR if file does not contain this many lines
__get_file_line() {
	MAX_LINES=$(__nbr_lines_in_file $FILE)
	if [ \( $1 -gt $MAX_LINES \) -o \( $1 -lt 1 \) ]; then
		echo ERROR
	else
		# instead of using head and tail ...
		D=$(sed -n -e "$1 {p; q}" $FILE)
		echo $D
	fi
}

#
# completion function for 'go' and 'cdd'
#
# Normally, would iterate over something and fill the COMPREPLY array
# In this case, we just want the contents of FILE to be displayed
__comp_go() {
	#k="${#COMPREPLY[@]}"
	echo
	if [ ! -s $FILE ]; then
		touch $FILE
		echo "<no entries in $FILE>"
	else
		cat -n $FILE
	fi
}

complete -F __comp_go go
complete -F __comp_go cdd

