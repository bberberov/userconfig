if   [[ ! -v VISUAL ]]
then
	userconfig_os="`uname -s`"

	which 'xhost' > /dev/null 2>&1 && xhost > /dev/null 2>&1
	userconfig_linux_x=$?

	if   [[ "${userconfig_os}" == 'Linux'  && ${userconfig_linux_x} \
	     || "${userconfig_os}" == 'Darwin' && "${TERM_PROGRAM}" == 'Apple_Terminal' \
	     || "${userconfig_os}" == 'Msys'
	     ]]
	then
		if   which kwrite > /dev/null 2>&1
		then
			export VISUAL='kwrite'
		elif which kate   > /dev/null 2>&1
		then
			export VISUAL='kate -n'
		fi
	fi

	unset userconfig_linux_x
	unset userconfig_os
fi

if   [[ ! -v VISUAL ]]
then
	if   which mcedit > /dev/null 2>&1
	then
		export VISUAL='mcedit'
	elif which nano   > /dev/null 2>&1
	then
		export VISUAL='nano'
	fi
fi

if   [[ ! -v EDITOR ]]
then
	if   which mcedit > /dev/null 2>&1
	then
		export EDITOR='mcedit'
	elif which nano   > /dev/null 2>&1
	then
		export EDITOR='nano'
	fi
fi
