# From https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/bash/files/bashrc
userconfig_use_color=false

case "${TERM}" in
	[aEkx]term*|rxvt*|gnome*|konsole*|linux|screen|tmux|cons25|*color) userconfig_use_color=true;;
esac

if   which less > /dev/null 2>&1
then
	#
	# NOTE: Probably not going to look for exceptions before version 340
	# NOTE: ( the introduction of the -F and -R options, and UTF-8 support)
	# NOTE: `--version` was added earlier
	#
	if   which sed > /dev/null 2>&1
	then
		less_version="`less --version | sed -nE -e '1{ s/^less ([0-9]+).*/\1/; p; }'`"
	elif which grep > /dev/null 2>&1
	then
		less_version="`less --version | grep -Eo '^less [0-9]+' | grep -Eo '[0-9]+'`"
	else
		less_version="340"
	fi

	LESS='-MiR'

	if   (( 358 < ${less_version} ))
	then
		# Major changes between "less" versions 354 and 358
		# --shift option was introduced
		if   (( 436 < ${less_version} ))
		then
			# Major changes between "less" versions 429 and 436
			# Fractions introduced to --shift option
			if   (( 661 <= ${less_version} && ${less_version} <= 668 ))
			then
				# Major changes between "less" versions 661 and 668
				# BUG (github #554)
				LESS="${LESS} --shift=16"
			else
				LESS="${LESS} --shift=.25"
			fi
		else
			LESS="${LESS} --shift=16"
		fi
	fi

	if   (( 575 < ${less_version} ))
	then
		# --use-color was introduced in 576
		if ${userconfig_use_color}
		then
			LESS="${LESS} --use-color"
		fi
	fi

	export LESS

	unset less_version
fi

unset userconfig_use_color
