#! /usr/bin/env bash

# Copyright © 2026 Boian Berberov
#
# Licensed under the EUPL-1.2 only.
# License text: https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12
# SPDX-License-Identifier: EUPL-1.2

# shellcheck disable=SC2034
{
	# dmn="${1}"
	src="${2:-"$( realpath "$( dirname "${BASH_SOURCE[0]}" )" )"}"
	dst="${3:-"${XDG_CONFIG_HOME:-${HOME}/.config}/dconf"}"
}

if   ! which dconf > /dev/null 2>&1
then
	if   (( 4 <= USER_COLORTERM ))
	then
		echo -e 'dconf not found, \e[34mskipping\e[0m'
	else
		echo 'dconf not found, skipping'
	fi
	exit 0
fi

configs=(
	'meld/org.gnome.meld'
)

dconf_mtime="$(stat --printf=%Y "${dst}/user")"

dconf_apply()
{
	# Arguments:
	# dir="${1}"
	# file="${2}"

	curr="$(dconf dump "${1}")"

	if   [[ -n "${curr}" ]]
	then
		if (( "$(stat --printf=%Y "${src}/${2}")" <= dconf_mtime ))
		then
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e '\e[33mMaking a new diff\e[0m'
			else
				echo 'Making a new diff'
			fi
			echo "${curr}" > "${src}/${2}"
		else
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e '\e[33mSkipping making new diff\e[0m, dconf DB was not modified since last diff'
			else
				echo 'Skipping making a new diff, dconf DB was not modified since last diff'
			fi
		fi
	else
		if   (( 4 <= USER_COLORTERM ))
		then
			echo -e '\e[32mApplying initial settings\e[0m'
		else
			echo 'Applying initial settings'
		fi
		dconf load -f "${1}" < "${src}/${2}"
	fi
}

dconf_on_exec()
{
	# Arguments:
	# exec="${1}"
	# dir="${2}"
	# file="${3}"

	if   which "${1}" > /dev/null 2>&1
	then
		echo -n "${1} was found: "
		dconf_apply "${2}" "${3}"
	else
		if   (( 4 <= USER_COLORTERM ))
		then
			echo -e "\e[34mSkipping\e[0m ${3} since ${1} was not found"
		else
			echo "Skipping ${3} since ${1} was not found"
		fi
		return 1
	fi
}

for config in "${configs[@]}"
do
	prog="${config%/*}"
	dir_dot="${config#*/}"
	file="${dir_dot}.keyfile"
	dir="/${dir_dot//.//}/"

	dconf_on_exec "${prog}" "${dir}" "${file}"
done
