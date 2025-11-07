# Based on (2025-10-15):
# https://gitweb.gentoo.org/repo/gentoo.git/tree/app-shells/bash/files/bashrc.d/10-gentoo-color-r2.bash

if   [[ -n "${USER_COLORTERM}" ]]
then
	# Respect existing setting
	true
elif [[ -n "${NO_COLOR}" ]]
then
	# Respect the user's wish not to use color. See https://no-color.org/.
	# 1 = wanted no color
	USER_COLORTERM=1
elif [[ '24bit' == "${COLORTERM}" || 'truecolor' == "${COLORTERM}" ]]
then
	# The COLORTERM environment variable can reasonably be trusted here.
	# See https://github.com/termstandard/colors for further information.
	USER_COLORTERM=24
else
	# Check TERM against a whitelist covering a majority of popular
	# terminal emulators and virtual console implementations known to
	# support color. If no matching entry is found, try to use tput(1) to
	# determine whether color is supported.
	case "${TERM}" in
		*direct*    )
			USER_COLORTERM=24
		;;
		*256color*  |\
		alacritty   |\
		contour     |\
		foot*       \
		)
			USER_COLORTERM=8
		;;
		*konsole*   |\
		dtterm      |\
		jfbterm     |\
		linux       |\
		screen*     |\
		tmux*       |\
		xterm*      \
		)
			# BUG not all of these have been verified
			# 5 = dim colors and [90–97, 100–107] colors supported
			USER_COLORTERM=5
		;;
		*color*     |\
		*ghostty    |\
		[aEk]term*  |\
		mlterm      |\
		rxvt*       |\
		wsvt25*     \
		)
			USER_COLORTERM=4
		;;
		*)
			if   which tput > /dev/null 2>&1
			then
				case "$(tput colors 2>/dev/null)" in
					16777216)
						USER_COLORTERM=24
					;;
					256)
						USER_COLORTERM=8
					;;
					16)
						if   [[ -n "$(tput dim 2>/dev/null)" ]]
						then
							# 5 = dim colors and [90–97, 100–107] colors supported
							USER_COLORTERM=5
						else
							USER_COLORTERM=4
						fi
					;;
				esac
			else
				# 0 = could not determine colors
				USER_COLORTERM=0
			fi
	esac
fi

export USER_COLORTERM
