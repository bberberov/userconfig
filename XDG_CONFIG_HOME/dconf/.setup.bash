#! /usr/bin/env bash

# Copyright © 2026 Boian Berberov
#
# Licensed under the EUPL-1.2 only.
# License text: https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12
# SPDX-License-Identifier: EUPL-1.2

dmn="${1}"
src="${2:-.}"
dst="${3}"

configs=(
	'meld/org.gnome.meld'
)

dconf_apply()
{
	# Arguments:
	# dir="${1}"
	# file="${2}"

	curr="$(dconf dump "${1}")"

	if   [[ -n "${curr}" ]]
	then
		echo 'Making new diff'
		echo "${curr}" > "${src}/${2}"
	else
		echo 'Applying initial settings'
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
		echo -n $'\t'"${1} was found: "
		dconf_apply "${2}" "${3}"
	else
		echo $'\t'"Skipping ${3} since ${1} was not found"
		return 1
	fi
}

for config in ${configs[@]}
do
	prog="${config%/*}"
	dir_dot="${config#*/}"
	file="${dir_dot}.keyfile"
	dir="/${dir_dot//.//}/"

	dconf_on_exec "${prog}" "${dir}" "${file}"
done
