# mv command unsing autojump 
jmv () {	
	DEST=${@: -1}
	FILE=( "$@" )
	NOCD="false"
	if [ $1 = "-nocd" ]; then 
		NOCD="true"
		FILE=( "${@:2}" )
	fi
	unset "FILE[${#array[@]}-1]"
	if [ -d "$DEST" ]; then
		mv -f $FILE $DEST
		if [ $NOCD = "false" ]; then 
			cd $DEST
		fi
	else 
		NEWDEST="`autojump $DEST`"
		if [ ! "$NEWDEST" = "." ]; then 
			if [ -t 1 ]; then  # if stdout is a terminal, use colors
				if [ $NOCD = "false" ]; then 
					echo -e "\\033[31mmv -f ${FILE} ${NEWDEST} && cd ${NEWDEST}\\033[0m" 
				else 
					echo -e "\\033[31mmv -f ${FILE} ${NEWDEST}\\033[0m" 
				fi
			else
				if [ $NOCD = "false" ]; then 
					echo -e "mv -f ${FILE} ${NEWDEST} && cd ${NEWDEST}"
				else 
					echo -e "mv -f ${FILE} ${NEWDEST}"
				fi
			fi
			mv -f $FILE $NEWDEST
			if [ $NOCD = "false" ]; then 
				cd $NEWDEST
			fi
		fi
	fi
}

# ls command using autojump
lj () {
	DESTINATION=${@: -1}
	OPTION=( "$@" )
	unset "OPTION[${#array[@]}-1]"
	if [[ $# -eq 0 ]] || [[ $DESTINATION == -* ]]; then
		ls $@
	elif [ -d "$DESTINATION" ]; then
		ls $OPTION  $DESTINATION
	else 
		NEWDESTINATION="`autojump $DESTINATION`"
		if [ ! "$NEWDESTINATION" = "." ]; then 
			if [ -t 1 ]; then  # if stdout is a terminal, use colors
				echo -e "\\033[31mls ${OPTION} ${NEWDESTINATION}\\033[0m"
			else
				echo -e "ls ${OPTION} ${NEWDESTINATION}"
			fi
			ls $OPTION $NEWDESTINATION
		fi 
	fi
}

# cp command usignb autojump
jcp () {	
	DEST=${@: -1}
	FILE=( "$@" )
	NOCD="false"
	if [ $1 = "-nocd" ]; then 
		NOCD="true"
		FILE=( "${@:2}" )
	fi
	unset "FILE[${#array[@]}-1]"
	if [ -d "$DEST" ]; then
		cp -r $FILE $DEST
		if [ $NOCD = "false" ]; then 
			cd $DEST
		fi
	else 
		NEWDEST="`autojump $DEST`"
		if [ ! "$NEWDEST" = "." ]; then 
			if [ -t 1 ]; then  # if stdout is a terminal, use colors
				if [ $NOCD = "false" ]; then 
					echo -e "\\033[31mcp -r ${FILE} ${NEWDEST} && cd ${NEWDEST}\\033[0m" 
				else 
					echo -e "\\033[31mcp -r ${FILE} ${NEWDEST}\\033[0m" 
				fi
			else
				if [ $NOCD = "false" ]; then 
					echo -e "cp -r ${FILE} ${NEWDEST} && cd ${NEWDEST}"
				else 
					echo -e "cp -f ${FILE} ${NEWDEST}"
				fi
			fi
			cp -r $FILE $NEWDEST
			if [ $NOCD = "false" ]; then 
				cd $NEWDEST
			fi
		fi
	fi

