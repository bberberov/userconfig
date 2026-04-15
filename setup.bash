#! /usr/bin/env bash

# Copyright © 2025, 2026 Boian Berberov
#
# Licensed under the EUPL-1.2 only.
# License text: https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12
# SPDX-License-Identifier: EUPL-1.2

domain='public'
userdir="/srv/user/${SUDO_USER:-${USER}}"
repo_name='userconfig.git'
repo_path="github.com/bberberov/${repo_name}"
perm_repo="${userdir}/vcs/${repo_path}"
repo_tree_f='${HOME}/user/config/'"${domain}"
repo_tree_e="${HOME}/user/config/${domain}"

# Check for necesary commands
for cmd in \
	chmod \
	grep \
	readlink \
	stat \
	sudo \
;
do
	if   ! which "${cmd}" > /dev/null 2>&1
	then
		echo "ERROR: command ${cmd} not found"
	fi
done

userlink()
{
	# bn="${1}"
	# tgt="${2}"
	# lnk="${3}"

	if   [[ -L "${3}" ]]
	then
		if   [[ "${2}" == "$(readlink "${3}")" ]]
		then
			echo "Using linked ${1}"
		else
			echo "/ Link mismatch ${1}: "
			echo "\ ${3} -> $(readlink "${3}")"
		fi
	elif [[ -e "${3}" ]]
	then
		if   [[ -f "${2}" ]]
		then
			if   [[ -f "${3}" ]]
			then
				echo "Existing file ${3}"
			else
				echo "Not a file or symlink ${3}"
			fi
		elif [[ -d "${2}" ]]
		then
			if   [[ -d "${3}" ]]
			then
				echo "Existing directory ${3}"
			else
				echo "Not a directory or symlink ${3}"
			fi
		else
			echo "Not a file, directory or symlink ${3}"
		fi
	else
		if   [[ -f "${2}" ]]
		then
			echo "Linking file ${1}"
		elif [[ -d "${2}" ]]
		then
			echo "Linking directory ${1}"
		else
			echo "Linking neither file nor directory ${1}"
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
						echo "Removing existing link ${bn} since none of { ${@} } were found"
						return 0
					else
						echo "Skipping existing link ${lnk}, points to $(readlink "${lnk}"), since none of { ${@} } were found"
						return 1
					fi
				else
					echo "Skipping ${bn} since none of { ${@} } were found"
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
					echo "Removing existing link ${bn} since ${bn} was not found"
					return 0
				else
					echo "Skipping existing link ${lnk}, points to $(readlink "${lnk}"), since ${bn} was not found"
					return 1
				fi
			else
				echo "Skipping ${bn} since ${bn} was not found"
				return 1
			fi
		fi
	fi
}

userskip()
{
	if   [[ -n "$3" ]]
	then
		echo "Skipping $1 intentionally, ${3} (${2})"
	else
		echo "Skipping $1 intentionally (${2})"
	fi
}

# Set up permanent repo and tree
if   (( 1000 <= EUID ))
then
	if   [[ ! -d "${perm_repo}" ]] || ! git -C "${perm_repo}" rev-parse --git-dir > /dev/null 2>&1
	then
		if   which git-clone-bare > /dev/null 2>&1
		then
			echo 'Setting up permanent userconfig repo'
			[[ -d "${userdir}" ]] || sudo mkdir -p "${userdir}"
			[[ -O "${userdir}" && -G "${userdir}" ]] || sudo bash -c '[[ -n "${SUDO_UID}" ]] && chown "${SUDO_UID}:${SUDO_GID}" '"${userdir}"
			[[ 700 -eq "$(stat --printf=%a "${userdir}")" ]] || chmod 700 "${userdir}"
			[[ -d "${perm_repo%/${repo_name}}" ]] || mkdir -p "${perm_repo%/${repo_name}}"

			# Bare clone and permanent tree setup
			git -C "${perm_repo%/${repo_name}}" clone-bare "https://${repo_path}"
		else
			echo '/ Cannot find git-clone-bare subcommand.'
			echo '\ Make sure git-clone-bare is in the PATH, or set up the permanent repo manually.'
			exit 1
		fi
	else
		echo "Using permanent userconfig repo: ${perm_repo}"
	fi

	if   [[ ! -d "${repo_tree_e}" ]] && ! git -C "${repo_tree_e}" rev-parse --git-dir > /dev/null 2>&1
	then
		echo 'Setting up permanent userconfig tree'
		git -C "${perm_repo}" worktree add "${repo_tree_e}"
	else
		echo "Using permanent userconfig tree: ${repo_tree_e}"
	fi
else
	if   [[ -n "${SUDO_USER}" ]]
	then
		if   [[ -d "${perm_repo}" ]] && git -C "${perm_repo}" rev-parse --git-dir > /dev/null 2>&1
		then
			if   [[ ! -d "${repo_tree_e}" ]] && ! git -C "${repo_tree_e}" rev-parse --git-dir > /dev/null 2>&1
			then
				echo "Setting up permanent userconfig repo and tree from user ${SUDO_USER}"
				git clone --shared --single-branch "${perm_repo}" "${repo_tree_e}"
			else
				echo "Using permanent userconfig tree: ${repo_tree_e}"
			fi
		else
			echo "User ${SUDO_USER} permanent userconfig repo is not set up yet"
		fi
	else
		echo "Setting up ${USER} userconfig requires sudo and SUDO_USER"
	fi
fi

# Update .profile if needed
if   ! grep -F 'for f in "'"${repo_tree_f}"'/HOME/profile.d/"*.profile' "${HOME}/.profile" > /dev/null 2>&1
then
	echo 'Adding .profile configuration'
	echo '
for f in "'"${repo_tree_f}"'/HOME/profile.d/"*.profile
do
	source "${f}"
done' >> "${HOME}/.profile"
else
	echo 'Skipping .profile configuration'
fi

# Update .bashrc if needed
if   ! grep -F 'for f in "'"${repo_tree_f}"'/HOME/bashrc.d/"*.bash' "${HOME}/.bashrc" > /dev/null 2>&1
then
	echo 'Adding .bashrc configuration'
	echo '
for f in "'"${repo_tree_f}"'/HOME/bashrc.d/"*.bash
do
	source "${f}"
done' >> "${HOME}/.bashrc"
else
	echo 'Skipping .bashrc configuration'
fi

# BEGIN HOME

echo
for f in "${repo_tree_e}/HOME/".*
do
	bn="$(basename ${f})"

	if   [[ -f "${f}" ]]
	then
		# NOTE: Special cases
		case "${bn}" in
			.clang-format)
				userlink_on_exec "${bn}" "${f}" "${HOME}/${bn}" clang-format
			;;
			.npmrc)
				userlink_on_exec "${bn}" "${f}" "${HOME}/${bn}" npm npm22 npm24
			;;
			.prettierrc.yaml)
				userlink_on_exec "${bn}" "${f}" "${HOME}/${bn}" prettier
			;;
			.uncrustify.cfg)
				userlink_on_exec "${bn}" "${f}" "${HOME}/${bn}" uncrustify
			;;
			.zypper.conf)
				userlink_on_exec "${bn}" "${f}" "${HOME}/${bn}" zypper
			;;
			*)
				echo "Skipping ${bn} because there is no specific definition"
			;;
		esac
	elif [[ -d "${f}" ]]
	then
		if   [[ -x "${f}/.setup.bash" ]]
		then
			echo "Delegating to ${f}/.setup.bash"
			"${f}/.setup.bash"
			echo "Finished with ${f}/.setup.bash"
		else
			# NOTE: Special cases
			case "${bn}" in
				.config | bashrc.d | profile.d)
					echo "Skipping ${bn} intentionally (${f})"
				;;
				*)
					echo "Skipping ${bn} because there is no specific definition (${f})"
				;;
			esac
		fi
	fi
done

# END   HOME

# BEGIN XDG_CONFIG_HOME

echo

XDG_CONFIG_HOME_local="${XDG_CONFIG_HOME:-${HOME}/.config}"

if   [[ ! -d "${XDG_CONFIG_HOME_local}" ]]
then
	echo "Created missing ${XDG_CONFIG_HOME_local}"
	mkdir -p "${XDG_CONFIG_HOME_local}"
	chmod 700 "${XDG_CONFIG_HOME_local}"
fi

for f in "${repo_tree_e}/XDG_CONFIG_HOME/"*
do
	bn="$(basename ${f})"

	# Exclude for non-users
	if   (( EUID < 1000 ))
	then
		case "${bn}" in
			kate | osc)
				echo "Skipping ${bn} for EUID ${EUID} (${f})"
				continue
			;;
		esac
	fi

	if   [[ -f "${f}" ]]
	then
		# NOTE: Special cases
		case "${bn}" in
			bash_completion)
				userlink_on_exec "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}" bash
			;;
			konsolerc)
				userlink_on_exec "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}" konsole
			;;
			plasma-nm)
				userlink_on_exec "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}" plasmashell
			;;
			*)
				userlink "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}"
			;;
		esac
	elif [[ -d "${f}" ]]
	then
		if   [[ -x "${f}/.setup.bash" ]]
		then
			echo "Delegating to ${f}/.setup.bash"
			"${f}/.setup.bash" "${domain}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}"
			echo "Finished with ${f}/.setup.bash"
		else
			# NOTE: Special cases
			case "${bn}" in
				git)
					userskip "${bn}" "${f}" 'second level only, configure manually'
				;;
				kate)
					userskip "${bn}" "${f}" 'second level only'
				;;
				*)
					userlink_on_exec "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}"
				;;
			esac
		fi
	fi
done

# END   XDG_CONFIG_HOME

# BEGIN XDG_DATA_HOME

echo

XDG_DATA_HOME_local="${XDG_DATA_HOME:-${HOME}.local/share}"

if   [[ ! -d "${XDG_DATA_HOME_local}" ]]
then
	echo "Created missing ${XDG_DATA_HOME_local}"
	mkdir -p "${XDG_DATA_HOME_local}"
	chmod 700 "${XDG_DATA_HOME_local}"
fi

for f in "${repo_tree_e}/XDG_DATA_HOME/"*
do
	bn="$(basename ${f})"

	# Exclude for non-users
	if   (( EUID < 1000 ))
	then
		case "${bn}" in
			konsole)
				echo "Skipping ${bn} for EUID ${EUID} (${f})"
				continue
			;;
		esac
	fi

	if   [[ -d "${f}" ]]
	then
		if   [[ -x "${f}/.setup.bash" ]]
		then
			echo "Delegating to ${f}/.setup.bash"
			"${f}/.setup.bash" "${domain}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}"
			echo "Finished with ${f}/.setup.bash"
		else
			# NOTE: Special cases
			case "${bn}" in
				bash-completion)
					userskip "${bn}" "${f}" 'use BASH_COMPLETION_USER_DIR'
				;;
				org.kde.syntax-highlighting)
					userskip "${bn}" "${f}" 'second level only'
				;;
				*)
					userlink_on_exec "${bn}" "${f}" "${XDG_DATA_HOME_local}/${bn}"
				;;
			esac
		fi
	fi
done

# END   XDG_DATA_HOME

# BEGIN Generated content

echo

XDG_CACHE_HOME_local="${XDG_CACHE_HOME:-${HOME}/.cache}"

if   which bat > /dev/null 2>&1
then
	if   [[ ! -d "${XDG_CACHE_HOME_local}/bat" ]]
	then
		echo "Generating initial bat cache"
		bat cache --build
	else
		echo "bat cache exists, skipping"
	fi
else
	echo "Skipping bat cache gneration, bat was not found"
fi

# END   Generated content
