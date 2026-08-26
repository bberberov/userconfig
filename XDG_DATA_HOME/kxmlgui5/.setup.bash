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
	dst="${3:-"${XDG_DATA_HOME:-${HOME}.local/share}/kxmlgui5"}"
}

userlink()
{
	# Arguments:
	# bn="${1}"
	# tgt="${2}"
	# lnk="${3}"

	if   [[ -L "${3}" ]]
	then
		if   [[ "${2}" == "$(readlink "${3}")" ]]
		then
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[32mUsing linked\e[0m ${1}"
			else
				echo "Using linked ${1}"
			fi
		else
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[31m/ Link mismatch\e[0m ${1}: "
				echo -e "\e[31m\ \e[0m${3} -> $(readlink "${3}")"
			else
				echo "/ Link mismatch ${1}: "
				echo "\ ${3} -> $(readlink "${3}")"
			fi
		fi
	elif [[ -e "${3}" ]]
	then
		if   [[ -f "${2}" ]]
		then
			if   [[ -f "${3}" ]]
			then
				if   (( 4 <= USER_COLORTERM ))
				then
					echo -e "\e[31mExisting file\e[0m ${3}"
				else
					echo "Existing file ${3}"
				fi
			else
				if   (( 4 <= USER_COLORTERM ))
				then
					echo -e "\e[34mNot a file or symlink\e[0m ${3}"
				else
					echo "Not a file or symlink ${3}"
				fi
			fi
		elif [[ -d "${2}" ]]
		then
			if   [[ -d "${3}" ]]
			then
				if   (( 4 <= USER_COLORTERM ))
				then
					echo -e "\e[31mExisting directory\e[0m ${3}"
				else
					echo "Existing directory ${3}"
				fi
			else
				if   (( 4 <= USER_COLORTERM ))
				then
					echo -e "\e[34mNot a directory or symlink\e[0m ${3}"
				else
					echo "Not a directory or symlink ${3}"
				fi
			fi
		else
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[34mNot a file, directory or symlink\e[0m ${3}"
			else
				echo "Not a file, directory or symlink ${3}"
			fi
		fi
	else
		if   [[ -f "${2}" ]]
		then
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[36mLinking file\e[0m ${1}"
			else
				echo "Linking file ${1}"
			fi
		elif [[ -d "${2}" ]]
		then
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[36mLinking directory\e[0m ${1}"
			else
				echo "Linking directory ${1}"
			fi
		else
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[36mLinking neither file nor directory\e[0m ${1}"
			else
				echo "Linking neither file nor directory ${1}"
			fi
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
		for cmd in "${@}"
		do
			if   type -fP "${cmd}" > /dev/null 2>&1
			then
				userlink "${bn}" "${tgt}" "${lnk}"
				return 0
			else
				if   [[ -L "${lnk}" ]]
				then
					if   [[ "${tgt}" == "$(readlink "${lnk}")" ]]
					then
						if   (( 4 <= USER_COLORTERM ))
						then
							echo -e "\e[33mRemoving existing link\e[0m ${bn} since none of { ${*} } were found"
						else
							echo "Removing existing link ${bn} since none of { ${*} } were found"
						fi
						return 0
					else
						if   (( 4 <= USER_COLORTERM ))
						then
							echo -e "\e[31mSkipping existing link\e[0m ${lnk}, points to $(readlink "${lnk}"), since none of { ${*} } were found"
						else
							echo "Skipping existing link ${lnk}, points to $(readlink "${lnk}"), since none of { ${*} } were found"
						fi
						return 1
					fi
				else
					if   (( 4 <= USER_COLORTERM ))
					then
						echo -e "\e[34mSkipping\e[0m ${bn} since none of { ${*} } were found"
					else
						echo "Skipping ${bn} since none of { ${*} } were found"
					fi
					return 1
				fi
			fi
		done
	else
		if   type -fP "${bn}" > /dev/null 2>&1
		then
			userlink "${bn}" "${tgt}" "${lnk}"
			return 0
		else
			if   [[ -L "${lnk}" ]]
			then
				if   [[ "${tgt}" == "$(readlink "${lnk}")" ]]
				then
					if   (( 4 <= USER_COLORTERM ))
					then
						echo -e "\e[33mRemoving existing link\e[0m ${bn} since ${bn} was not found"
					else
						echo "Removing existing link ${bn} since ${bn} was not found"
					fi
					return 0
				else
					if   (( 4 <= USER_COLORTERM ))
					then
						echo -e "\e[31mSkipping existing link\e[0m ${lnk}, points to $(readlink "${lnk}"), since ${bn} was not found"
					else
						echo "Skipping existing link ${lnk}, points to $(readlink "${lnk}"), since ${bn} was not found"
					fi
					return 1
				fi
			else
				if   (( 4 <= USER_COLORTERM ))
				then
					echo -e "\e[34mSkipping\e[0m ${bn} since ${bn} was not found"
				else
					echo "Skipping ${bn} since ${bn} was not found"
				fi
				return 1
			fi
		fi
	fi
}

for f in "${src}/"*
do
	bn="$(basename "${f}")"

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
