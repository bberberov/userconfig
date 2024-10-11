# From https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/bash/files/bashrc
userconfig_use_color=false

case "${TERM}" in
	[aEkx]term*|rxvt*|gnome*|konsole*|linux|screen|tmux|cons25|*color) userconfig_use_color=true;;
esac

if   which less > /dev/null 2>&1
then
	if   which sed > /dev/null 2>&1 \
	     && (( 575 < `less --version | sed -nE -e '1{ s/^less ([0-9]+).*/\1/; p; }'` )) \
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
