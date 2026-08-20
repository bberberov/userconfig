#! /usr/bin/env bash

# Copyright © 2026 Boian Berberov
#
# Licensed under the EUPL-1.2 only.
# License text: https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12
# SPDX-License-Identifier: EUPL-1.2

# shellcheck disable=SC2034
{
	dmn="${1:-public}"
	src="${2:-"$( dirname "${BASH_SOURCE[0]}" )"}"
	dst="${3:-"${XDG_CONFIG_HOME:-${HOME}/.config}/git"}"
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

git_include_exists()
{
	[[
		-n "$(
			git config get \
				--file "${1}" \
				--all \
				--fixed-value \
				--value="${2}" \
				include.path
		)"
	]]
	return $?
}

git_include_append()
{
	if   (( 4 <= USER_COLORTERM ))
	then
		echo -e "\e[33mAdding\e[0m ${2} \e[33mto\e[0m ${1}"
	else
		echo "Adding ${2} to ${1}"
	fi
	git config set \
		--file "${1}" \
		--append \
		include.path \
		"${2}"
}

git_include_remove()
{
	if   (( 4 <= USER_COLORTERM ))
	then
		echo -e "\e[33mRemoving\e[0m ${2} \e[33mfrom\e[0m ${1}"
	else
		echo "Removing ${2} from ${1}"
	fi
	git config unset \
		--file "${1}" \
		--fixed-value \
		--value="${2}" \
		include.path
}

git_include_skip()
{
	if   [[ -n "${3}" ]]
	then
		if   (( 4 <= USER_COLORTERM ))
		then
			echo -e "\e[34mSkipped adding\e[0m ${2} \e[34mto\e[0m ${1}\e[34m,\e[0m ${3}"
		else
			echo "Skipped adding ${2} to ${1}, ${3}"
		fi
	else
		if   (( 4 <= USER_COLORTERM ))
		then
			echo -e "\e[34mSkipped adding\e[0m ${2} \e[34mto\e[0m ${1}"
		else
			echo "Skipped adding ${2} to ${1}"
		fi
	fi
}

if   ! which git > /dev/null 2>&1
then
	if   (( 4 <= USER_COLORTERM ))
	then
		echo -e 'git not found, \e[34mskipping\e[0m'
	else
		echo 'git not found, skipping'
	fi
	exit 0
fi

if   [[ ! -d "${dst}"  ]]
then
	echo "Creating ${dst}"
	mkdir -p "${dst}"
fi

# Link global ignore file
userlink ignore "${src}/ignore" "${dst}/ignore"

# Link domain-specific directory file
userlink config.d "${src}/config.d" "${dst}/config.${dmn}.d"

# Add default config, which includes user.config and host/
if   ! git_include_exists "${dst}/config" "config.${dmn}.d/default.config"
then
	git_include_append "${dst}/config" "config.${dmn}.d/default.config"
else
	git_include_skip "${dst}/config" "config.${dmn}.d/default.config"
fi

# Add "simple" app/ configs
for app in \
	bat \
	bzip2 \
	delta \
	difftastic \
	eza \
	meld \
	mergiraf \
	xz \
	zstd \
;
do
	if   which "${app}" > /dev/null 2>&1
	then
		if   ! git_include_exists "${dst}/config" "config.${dmn}.d/app/${app}.config"
		then
			git_include_append "${dst}/config" "config.${dmn}.d/app/${app}.config"
		else
			git_include_skip "${dst}/config" "config.${dmn}.d/app/${app}.config"
		fi
	else
		if   git_include_exists "${dst}/config" "config.${dmn}.d/app/${app}.config"
		then
			git_include_remove "${dst}/config" "config.${dmn}.d/app/${app}.config"
		else
			git_include_skip "${dst}/config" "config.${dmn}.d/app/${app}.config" "${app} not found"
		fi
	fi
done

# Add less-621+ config
if   which less > /dev/null 2>&1
then
	if   which sed > /dev/null 2>&1
	then
		less_version="$(less --version | sed -nE -e '1{ s/^less ([0-9]+).*/\1/; p; }')"
	elif which grep > /dev/null 2>&1
	then
		less_version="$(less --version | grep -Eo '^less [0-9]+' | grep -Eo '[0-9]+')"
	else
		less_version='340'
	fi
else
	less_version='0'
fi

if   (( 621 <= less_version ))
then
	if   ! git_include_exists "${dst}/config" "config.${dmn}.d/app/less-621+.config"
	then
		git_include_append "${dst}/config" "config.${dmn}.d/app/less-621+.config"
	else
		git_include_skip "${dst}/config" "config.${dmn}.d/app/less-621+.config"
	fi
else
	if   git_include_exists "${dst}/config" "config.${dmn}.d/app/less-621+.config"
	then
		git_include_remove "${dst}/config" "config.${dmn}.d/app/less-621+.config"
	else
		git_include_skip "${dst}/config" "config.${dmn}.d/app/less-621+.config" 'less-621+ not found'
	fi
fi
