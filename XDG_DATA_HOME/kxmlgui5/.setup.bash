#! /usr/bin/env bash

# Copyright © 2026 Boian Berberov
#
# Licensed under the EUPL-1.2 only.
# License text: https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12
# SPDX-License-Identifier: EUPL-1.2

dmn="${1:-public}"
src="${2:-"$( dirname "${BASH_SOURCE[0]}" )"}"
dst="${3:-"${XDG_DATA_HOME:-${HOME}.local/share}/kxmlgui5"}"

userlink()
{
	# bn="${1}"
	# tgt="${2}"
	# lnk="${3}"

	if   [[ -L "${3}" ]]
	then
		if   [[ "${2}" == "$(readlink "${3}")" ]]
		then
			echo $'\t'"Using linked ${1}"
		else
			echo $'\t'"/ Link mismatch ${1}: "
			echo $'\t'"\ ${3} -> $(readlink "${3}")"
		fi
	elif [[ -e "${3}" ]]
	then
		if   [[ -f "${2}" ]]
		then
			if   [[ -f "${3}" ]]
			then
				echo $'\t'"Existing file ${3}"
			else
				echo $'\t'"Not a file or symlink ${3}"
			fi
		elif [[ -d "${2}" ]]
		then
			if   [[ -d "${3}" ]]
			then
				echo $'\t'"Existing directory ${3}"
			else
				echo $'\t'"Not a directory or symlink ${3}"
			fi
		else
			echo $'\t'"Not a file, directory or symlink ${3}"
		fi
	else
		if   [[ -f "${2}" ]]
		then
			echo $'\t'"Linking file ${1}"
		elif [[ -d "${2}" ]]
		then
			echo $'\t'"Linking directory ${1}"
		else
			echo $'\t'"Linking neither file nor directory ${1}"
		fi
		ln --symbolic --no-target-directory "$2" "$3"
	fi
}

userlink_on_exec()
{
	local bn="${1}"
	local tgt="${2}"
	local lnk="${3}"

	shift 3

	if   (( 0 < $# ))
	then
		for cmd in ${@}
		do
			if   which "${cmd}" > /dev/null 2>&1
			then
				userlink "${bn}" "${tgt}" "${lnk}"
				return 0
			else
				if   [[ -L "${lnk}" ]]
				then
					if   [[ "${tgt}" == "$(readlink "${lnk}")" ]]
					then
						echo $'\t'"Removing existing link ${bn} since none of { ${@} } were found"
						return 0
					else
						echo $'\t'"Skipping existing link ${lnk}, points to $(readlink "${lnk}"), since none of { ${@} } were found"
						return 1
					fi
				else
					echo $'\t'"Skipping ${bn} since none of { ${@} } were found"
					return 1
				fi
			fi
		done
	else
		if   which "${bn}" > /dev/null 2>&1
		then
			userlink "${bn}" "${tgt}" "${lnk}"
			return 0
		else
			if   [[ -L "${lnk}" ]]
			then
				if   [[ "${tgt}" == "$(readlink "${lnk}")" ]]
				then
					echo $'\t'"Removing existing link ${bn} since ${bn} was not found"
					return 0
				else
					echo $'\t'"Skipping existing link ${lnk}, points to $(readlink "${lnk}"), since ${bn} was not found"
					return 1
				fi
			else
				echo $'\t'"Skipping ${bn} since ${bn} was not found"
				return 1
			fi
		fi
	fi
}

for f in "${src}/"*
do
	bn="$(basename ${f})"

	if   [[ -d "${f}" ]]
	then
		# NOTE: Special cases
		case "${bn}" in
			katepart)
				userlink_on_exec "${bn}" "${f}" "${dst}/${bn}" kate
			;;
			*)
				userlink_on_exec "${bn}" "${f}" "${dst}/${bn}"
			;;
		esac
	fi
done
