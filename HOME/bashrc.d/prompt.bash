case "${-:-}" in *i* )  # BEGIN Interactive only

# NOTE: makes use of the USER_COLORTERM environment variable

# NOTE: must wrap non-printable in '\[' and '\]', see https://mywiki.wooledge.org/BashFAQ/053
if   (( 5 <= USER_COLORTERM ))
then
	yel=$'\[\e[0;93m\]'
	grn=$'\[\e[92m\]'
	tyl=$'\[\e[96m\]'

	rc=$'\[\e[95m\] $? '
	ep=$'\[\e[0m\] '
	nl=$'\[\e[0m\]\n'
	wd=$'\[\e[90m\]:\[\e[94m\]\w'

	conn="${SSH_CONNECTION:+$'\[\e[0m\]ssh://'}"

	if   (( EUID < 1000 ))
	then
		un=$'\[\e[91m\]\u\[\e[90m\]@'
		pc=$'\[\e[91m\]'
	else
		un=$'\[\e[92m\]\u\[\e[90m\]@'
		pc=$'\[\e[94m\]'
	fi
elif (( 4 <= USER_COLORTERM ))
then
	yel=$'\[\e[0;1;33m\]'
	grn=$'\[\e[1;32m\]'
	tyl=$'\[\e[1;36m\]'

	rc=$'\[\e[1;35m\] $? '
	ep=$'\[\e[0m\] '
	nl=$'\[\e[0m\]\n'
	wd=$'\[\e[1;30m\]:\[\e[1;34m\]\w'

	conn="${SSH_CONNECTION:+$'\[\e[0m\]ssh://'}"

	if   (( EUID < 1000 ))
	then
		un=$'\e[01;31m\u\[\e[1;30m\]@'
		pc=$'\e[01;31m'
	else
		un=$'\e[01;32m\u\[\e[1;30m\]@'
		pc=$'\e[01;34m'
	fi
else
	yel=''
	grn=''
	tyl=''

	rc=' $? '
	ep=' '
	nl='\n'
	wd=':\w'

	conn="${SSH_CONNECTION:+ssh://}"

	un='\u@'
	pc=''
fi

if
	(( 4 == BASH_VERSINFO[0] && 2 <= BASH_VERSINFO[1] \
	|| 4  < BASH_VERSINFO[0] \
	))
then
	# NOTE:
	# 4.4: PS0
	# 4.2: Unicode in $'xxx', [[ -v ]] check
	# 2.0: String expansion $'xxx'
	if   [[ -v NO_PII ]]
	then
		hn='test.test'
	else
		hn='\h'
	fi

	PS0="${yel}"$'\u25b6 \\t \u25b6'"${nl}"
	PS2="${pc}"$'\u25b6'"${ep}"
	PS1="${yel}"$'\u2500 \\t \u25c0'"${rc}${conn}${un}${tyl}${hn}${wd}${nl}${PS2}"
	PS4="${pc}"$'\u2295'"${ep}"
else
	if   [[ -n "${NO_PII:-}" ]]
	then
		hn='test.test'
	else
		hn='\h'
	fi

	PS2="${pc}>${ep}"
	PS1="${yel}"'- \t <'"${rc}${conn}${un}${tyl}${hn}${wd}${nl}${PS2}"
	PS4="${pc}+${ep}"
fi

;; esac                 # END   Interactive only
