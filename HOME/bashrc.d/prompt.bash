# NOTE: makes use of the USER_COLORTERM environment variable

if   (( 4 <= USER_COLORTERM ))
then
	if   (( EUID < 1000 ))
	then
		userconfig_user_color='\[\e[01;31m\]'
		userconfig_prompt_color='\[\e[01;31m\]'
	else
		userconfig_user_color='\[\e[01;32m\]'
		userconfig_prompt_color='\[\e[01;34m\]'
	fi
fi

if   (( 4 == BASH_VERSINFO[0] && 2 <= BASH_VERSINFO[1] \
     || 4  < BASH_VERSINFO[0] \
     ))
then
	# Unicode in 4.2, [[ -v ]] check in 4.2, '+=' operator in 3.1, String expansion $'xxx' in 2.1
	if   (( 4 <= USER_COLORTERM ))
	then
		PS0=$'\[\e[01;33m\]\u25b6 \\t \u25b6\[\e[0m\]\n'
		PS1=$'\[\e[01;33m\]\u2500 \\t \u25c0\[\e[01;35m\] $? \[\e[0m\]'
		if [[ -v NO_PII ]]
		then
		PS1+="${userconfig_user_color}"$'\u\[\e[01;30m\]@\[\e[01;36m\]test.test\[\e[01;30m\]:\[\e[01;34m\]\W\[\e[0m\]\n'
		else
		PS1+="${userconfig_user_color}"$'\u\[\e[01;30m\]@\[\e[01;36m\]\h\[\e[01;30m\]:\[\e[01;34m\]\w\[\e[0m\]\n'
		fi
		PS1+="${userconfig_prompt_color}"$'\u25b6\[\e[0m\] '
	else
		PS0=$'\u25b6 \\t \u25b6\n'
		PS1=$'\u2500 \\t \u25c0 $? '
		if [[ -v NO_PII ]]
		then
		PS1+=$'\u@test.test:\W\n'
		else
		PS1+=$'\u@\h:\w\n'
		fi
		PS1+=$'\u25b6 '
	fi
else
	# Bash should support '\n' for PS? variables in all versions?
	if   (( 4 <= USER_COLORTERM ))
	then
		PS0='\[\e[01;33m\]> \\t >\[\e[0m\]\n'
		if   [[ -n "${NO_PII}" ]]
		then
		PS1='\[\e[01;33m\]- \\t <\[\e[01;35m\] $? \[\e[0m\]'"${userconfig_user_color}"'\u\[\e[01;30m\]@\[\e[01;36m\]test.test\[\e[01;30m\]:\[\e[01;34m\]\W\[\e[0m\]\n'"${userconfig_prompt_color}"'>\[\e[0m\] '
		else
		PS1='\[\e[01;33m\]- \\t <\[\e[01;35m\] $? \[\e[0m\]'"${userconfig_user_color}"'\u\[\e[01;30m\]@\[\e[01;36m\]\h\[\e[01;30m\]:\[\e[01;34m\]\w\[\e[0m\]\n'"${userconfig_prompt_color}"'>\[\e[0m\] '
		fi
	else
		PS0='> \t >\n'
		if   [[ -n "${NO_PII}" ]]
		then
		PS1='- \t < $? \u@test.test:\W\n> '
		else
		PS1='- \t < $? \u@\h:\w\n> '
		fi
	fi
fi
