case "${-:-}" in *i* )  # BEGIN Interactive only

# NOTE: makes use of the USER_COLORTERM environment variable

if   type -fP 'less' > '/dev/null' 2>&1
then
	#
	# NOTE: Probably not going to look for exceptions before version 340
	# NOTE: ( the introduction of the -F and -R options, and UTF-8 support)
	# NOTE: `--version` was added earlier
	#
	if   type -fP 'sed' > '/dev/null' 2>&1
	then
		less_version="$(less --version | sed -nE -e '1{ s/^less ([0-9]+).*/\1/; p; }')"
	elif type -fP 'grep' > '/dev/null' 2>&1
	then
		less_version="$(less --version | grep -Eo '^less [0-9]+' | grep -Eo '[0-9]+')"
	else
		less_version='340'
	fi

	LESS='-MiR'

	if   (( 358 < less_version ))
	then
		if   (( 436 < less_version ))
		then
			if   (( 661 <= less_version && less_version <= 668 ))
			then
				# Major changes between "less" versions 661 and 668
				# BUG (github #554), don't use fractions
				LESS="${LESS} --shift=16"
			else
				# Major changes between "less" versions 429 and 436
				# Fractions introduced to --shift option
				LESS="${LESS} --shift=.25"
			fi

			if   (( 575 < less_version ))
			then
				# --use-color was introduced in 576
				if   (( 4 <= USER_COLORTERM ))
				then
					LESS="${LESS} --use-color"
				fi

				if   (( 620 < less_version ))
				then
					# --wordwrap was introduced in 621
					alias less-wrap='less --wordwrap'

					if   (( 677 < less_version ))
					then
						# variable LESS_SHELL_LINES was introduced in 678
						export LESS_SHELL_LINES=3
					fi
				fi
			fi
		else
			# Major changes between "less" versions 354 and 358
			# --shift option was introduced
			LESS="${LESS} --shift=16"
		fi
	fi

	export LESS
fi

;; esac                 # END   Interactive only
