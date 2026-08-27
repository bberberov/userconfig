if   [ -n "${NO_PII:-}" ]
then
	hn='test.test'
else
	hn='${HOSTNAME}'
fi

if   [ 4 -le "${USER_COLORTERM}" ]
then
	yel="$(echo '\033[0;1;33m')"
	grn="$(echo '\033[1;32m')"
	tyl="$(echo '\033[1;36m')"

	rc="$(echo '\033[1;35m $? ')"
	ep="$(echo '\033[0m ')"
	# NOTE: \\n needed for newline to work
	nl="$(echo '\033[0m\\n')"
	wd="$(echo '\033[1;30m:\033[1;34m${PWD}')"

	conn="${SSH_CONNECTION:+"$(echo '\033[0mssh://')"}"

	if   [ ${EUID} -lt 1000 ]
	then
		un="$(echo '\033[01;31m${USER}\033[1;30m@')"
		pc="$(echo '\033[01;31m')"
	else
		un="$(echo '\033[01;32m${USER}\033[1;30m@')"
		pc="$(echo '\033[01;34m')"
	fi
else
	yel=''
	grn=''
	tyl=''

	rc=' $? '
	ep=' '
	nl='\n'
	wd=':${PWD}'

	conn="${SSH_CONNECTION:+ssh://}"

	un='${USER}@'
	pc=''
fi

PS2="${pc}>${ep}"
# NOTE: Needed for newline to work
nlps2="$(echo "${nl}${PS2}")"
PS1="${yel}"'- $(date +%H:%M:%S) <'"${rc}${conn}${un}${tyl}${hn}${wd}${nlps2}"
PS4="${pc}+${ep}"
