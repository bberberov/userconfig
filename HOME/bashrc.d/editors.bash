case "${-:-}" in *i* )  # BEGIN Interactive only

if   [[ -z "${VISUAL}" ]]
then
	userconfig_os="$(uname -s)"

	if   [[ 'Linux' == "${userconfig_os}" ]]
	then
		type -fP 'xhost' > '/dev/null' 2>&1 && xhost > '/dev/null' 2>&1
		userconfig_linux_x=$?
	else
		userconfig_linux_x=1
	fi

	if
		(( 0 == userconfig_linux_x )) \
		|| \
		[[ \
			'Darwin' == "${userconfig_os}" && 'Apple_Terminal' == "${TERM_PROGRAM}" \
			|| 'Windows_NT' == "${OS}" && 'MINGW64' == "${MSYSTEM}" \
		]]
	then
		if   type -fP 'kwrite' > '/dev/null' 2>&1
		then
			export VISUAL='kwrite'
		elif type -fP 'kate' > '/dev/null' 2>&1
		then
			export VISUAL='kate -n'
		fi
	elif type -fP 'mcedit' > '/dev/null' 2>&1
	then
		export VISUAL='mcedit'
	elif type -fP 'nano' > '/dev/null' 2>&1
	then
		export VISUAL='nano'
	fi
fi

if   [[ -z "${EDITOR}" ]]
then
	if   type -fP 'mcedit' > '/dev/null' 2>&1
	then
		export EDITOR='mcedit'
	elif type -fP 'nano' > '/dev/null' 2>&1
	then
		export EDITOR='nano'
	fi
fi

;; esac                 # END   Interactive only
