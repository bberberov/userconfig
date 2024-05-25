# From https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/bash/files/bashrc
userconfig_use_color=false

case "${TERM}" in
	[aEkx]term*|rxvt*|gnome*|konsole*|screen|tmux|cons25|*color) userconfig_use_color=true;;
esac

if   (( 4 == BASH_VERSINFO[0] && 2 <= BASH_VERSINFO[1] \
     || 4  < BASH_VERSINFO[0] \
     ))
then
	if ${userconfig_use_color}
	then
		PS0=$'\[\e[01;33m\]\u25b6 \\t \u25b6\[\e[0m\]\n'
		PS1=$'\[\e[01;33m\]\u2500 \\t \u25c0\[\e[01;35m\] $? \[\e[0m\]'
		PS1+='\[\e[01;32m\]\u\[\e[01;30m\]@\[\e[01;36m\]\h\[\e[01;30m\]:\[\e[01;34m\]\w\[\e[0m\]\n'
		PS1+=$'\[\e[01;34m\]\u25b6\[\e[0m\] '
	else
		PS0=$'\u25b6 \\t \u25b6\n'
		PS1=$'\u2500 \\t \u25c0 $? '
		PS1+='\u@\h:\w\n'
		PS1+=$'\u25b6 '
	fi
else
	if ${userconfig_use_color}
	then
		PS0=$'\[\e[01;33m\]> \\t >\[\e[0m\]\n'
		PS1=$'\[\e[01;33m\]- \\t <\[\e[01;35m\] $? \[\e[0m\]'
		PS1+='\[\e[01;32m\]\u\[\e[01;30m\]@\[\e[01;36m\]\h\[\e[01;30m\]:\[\e[01;34m\]\w\[\e[0m\]\n'
		PS1+=$'\[\e[01;34m\]>\[\e[0m\] '
	else
		PS0=$'> \\t >\n'
		PS1=$'- \\t < $? '
		PS1+='\u@\h:\w\n'
		PS1+=$'> '
	fi
fi

if   which less > /dev/null 2>&1
then
	if   which sed > /dev/null 2>&1 \
	     && (( 575 < `less --version | sed -nEe '1{s/^less ([0-9]+).*/\1/;p;}'` )) \
	     || \
	     which grep > /dev/null 2>&1 \
	     && (( 575 < `less --version | grep -Eo '^less [0-9]+' | grep -Eo '[0-9]+'` ))
	then
		# --use-color was introduced in 576
		if ${userconfig_use_color}
		then
			export LESS='-MiR --use-color'
		else
			export LESS='-Mi'
		fi
	else
		if ${userconfig_use_color}
		then
			export LESS='-MiR'
		else
			export LESS='-Mi'
		fi
	fi
fi

unset userconfig_use_color
