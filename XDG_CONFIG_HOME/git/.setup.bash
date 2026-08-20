#! /usr/bin/env bash

# Copyright © 2026 Boian Berberov
#
# Licensed under the EUPL-1.2 only.
# License text: https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12
# SPDX-License-Identifier: EUPL-1.2

dmn="${1:-public}"
src="${2:-"$( dirname "${BASH_SOURCE[0]}" )"}"
dst="${3:-"${XDG_CONFIG_HOME:-${HOME}/.config}/git"}"

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
	git config set \
		--file "${1}" \
		--append \
		include.path \
		"${2}"
}

git_include_remove()
{
	git config unset \
		--file "${1}" \
		--fixed-value \
		--value="${2}" \
		include.path
}

if   ! which git > /dev/null 2>&1
then
	echo 'git not found, skipping'
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
	echo $'\tAdding default.config to git/config'
	git_include_append "${dst}/config" "config.${dmn}.d/default.config"
else
	echo $'\tSkipped adding default.config to git/config'
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
			echo $'\t'"Adding app/${app}.config to git/config"
			git_include_append "${dst}/config" "config.${dmn}.d/app/${app}.config"
		else
			echo $'\t'"Skipped adding app/${app}.config to git/config"
		fi
	else
		if   git_include_exists "${dst}/config" "config.${dmn}.d/app/${app}.config"
		then
			echo $'\t'"Removing app/${app}.config from git/config"
			git_include_remove "${dst}/config" "config.${dmn}.d/app/${app}.config"
		else
			echo $'\t'"Skipped adding app/${app}.config to git/config, ${app} not found"
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
		echo $'\t'"Adding app/less-621+.config to git/config"
		git_include_append "${dst}/config" "config.${dmn}.d/app/less-621+.config"
	else
		echo $'\t'"Skipped adding app/less-621+.config to git/config"
	fi
else
	if   git_include_exists "${dst}/config" "config.${dmn}.d/app/less-621+.config"
	then
		echo $'\t'"Removing app/less-621+.config from git/config"
		git_include_remove "${dst}/config" "config.${dmn}.d/app/less-621+.config"
	else
		echo $'\t'"Skipped adding app/less-621+.config to git/config, less-621+ not found"
	fi
fi
