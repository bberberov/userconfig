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
# shellcheck disable=SC2016
repo_tree_f='${HOME}/user/config/'"${domain}"
repo_tree_e="${HOME}/user/config/${domain}"

# Check for necesary commands
for cmd in \
	chmod \
	grep \
	ls \
	readlink \
	stat \
	sudo \
;
do
	if   ! type -fP "${cmd}" > '/dev/null' 2>&1
	then
		if   (( 4 <= USER_COLORTERM ))
		then
			echo -e "\e[31mERROR: command ${cmd} not found\e[0m"
		else
			echo "ERROR: command ${cmd} not found"
		fi
	fi
done

userlink()
{
	local bn="${1}"
	local tgt="${2}"
	local lnk="${3}"

	if   [[ -L "${lnk}" ]]
	then
		if   [[ "${tgt}" == "$(readlink "${lnk}")" ]]
		then
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[32mUsing linked\e[0m ${bn}"
			else
				echo "Using linked ${bn}"
			fi
		else
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[31m/ Link mismatch\e[0m ${bn}: "
				echo -e "\e[31m\ \e[0m${lnk} -> $(readlink "${lnk}")"
			else
				echo "/ Link mismatch ${bn}: "
				echo "\ ${lnk} -> $(readlink "${lnk}")"
			fi
		fi
	elif [[ -e "${lnk}" ]]
	then
		if   [[ -f "${tgt}" ]]
		then
			if   [[ -f "${lnk}" ]]
			then
				if   (( 4 <= USER_COLORTERM ))
				then
					echo -e "\e[31mExisting file\e[0m ${lnk}"
				else
					echo "Existing file ${lnk}"
				fi
			else
				if   (( 4 <= USER_COLORTERM ))
				then
					echo -e "\e[34mNot a file or symlink\e[0m ${lnk}"
				else
					echo "Not a file or symlink ${lnk}"
				fi
			fi
		elif [[ -d "${tgt}" ]]
		then
			if   [[ -d "${lnk}" ]]
			then
				if   (( 4 <= USER_COLORTERM ))
				then
					echo -e "\e[31mExisting directory\e[0m ${lnk}"
				else
					echo "Existing directory ${lnk}"
				fi
			else
				if   (( 4 <= USER_COLORTERM ))
				then
					echo -e "\e[34mNot a directory or symlink\e[0m ${lnk}"
				else
					echo "Not a directory or symlink ${lnk}"
				fi
			fi
		else
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[34mNot a file, directory or symlink\e[0m ${lnk}"
			else
				echo "Not a file, directory or symlink ${lnk}"
			fi
		fi
	else
		if   [[ -f "${tgt}" ]]
		then
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[36mLinking file\e[0m ${bn}"
			else
				echo "Linking file ${bn}"
			fi
		elif [[ -d "${tgt}" ]]
		then
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[36mLinking directory\e[0m ${bn}"
			else
				echo "Linking directory ${bn}"
			fi
		else
			if   (( 4 <= USER_COLORTERM ))
			then
				echo -e "\e[36mLinking neither file nor directory\e[0m ${bn}"
			else
				echo "Linking neither file nor directory ${bn}"
			fi
		fi
		ln --symbolic --no-target-directory "$2" "$3"
	fi
}

userlink_on()
{
	local success="${1}"
	local bn="${2}"
	local tgt="${3}"
	local lnk="${4}"

	shift 4

	if   (( 0 < $# ))
	then
		if   (( 0 == success ))
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
	else
		if   (( 0 == success ))
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
						echo "\e[33mRemoving existing link\e[0m ${bn} since ${bn} was not found"
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
			if   type -fP "${cmd}" > '/dev/null' 2>&1
			then
				userlink_on 0 "${bn}" "${tgt}" "${lnk}" ${@}
				return 0
			fi
		done

		userlink_on 1 "${bn}" "${tgt}" "${lnk}" ${@}
		return 1
	else
		if   type -fP "${bn}" > '/dev/null' 2>&1
		then
			userlink_on 0 "${bn}" "${tgt}" "${lnk}"
			return 0
		fi

		userlink_on 1 "${bn}" "${tgt}" "${lnk}"
		return 1
	fi
}

userlink_on_lib()
{
	local bn="${1}"
	local tgt="${2}"
	local lnk="${3}"

	shift 3

	if   (( 0 < $# ))
	then
		for lib in "${@}"
		do
			if   ls -1 "/usr/lib64/${lib}"-* > /dev/null 2>&1 || ls -1 "/usr/lib/${lib}"-* > /dev/null 2>&1
			then
				userlink_on 0 "${bn}" "${tgt}" "${lnk}" ${@}
				return 0
			fi
		done

		userlink_on 1 "${bn}" "${tgt}" "${lnk}" ${@}
		return 1
	else
		if   ls -1 "/usr/lib64/lib${bn}"-* > /dev/null 2>&1 || ls -1 "/usr/lib/lib${bn}"-* > /dev/null 2>&1
		then
			userlink_on 0 "${bn}" "${tgt}" "${lnk}"
			return 0
		fi

		userlink_on 1 "${bn}" "${tgt}" "${lnk}"
		return 1
	fi
}

userskip()
{
	if   [[ -n "$3" ]]
	then
		if   (( 4 <= USER_COLORTERM ))
		then
			echo -e "\e[34mSkipping\e[0m $1 intentionally, ${3} (${2})"
		else
			echo "Skipping $1 intentionally, ${3} (${2})"
		fi
	else
		if   (( 4 <= USER_COLORTERM ))
		then
			echo -e "\e[34mSkipping\e[0m $1 intentionally (${2})"
		else
			echo "Skipping $1 intentionally (${2})"
		fi
	fi
}

# Set up permanent repo and tree
if   (( 1000 <= EUID ))
then
	if   [[ ! -d "${perm_repo}" ]] || ! git -C "${perm_repo}" rev-parse --git-dir > /dev/null 2>&1
	then
		if   type -fP 'git-clone-bare' > '/dev/null' 2>&1
		then
			echo 'Setting up permanent userconfig repo'
			[[ -d "${userdir}" ]] || sudo mkdir -p "${userdir}"
			[[ -O "${userdir}" && -G "${userdir}" ]] || sudo bash -c '[[ -n "${SUDO_UID}" ]] && chown "${SUDO_UID}:${SUDO_GID}" '"${userdir}"
			[[ 700 -eq "$(stat --printf=%a "${userdir}")" ]] || chmod 700 "${userdir}"
			[[ -d "${perm_repo%"/${repo_name}"}" ]] || mkdir -p "${perm_repo%"/${repo_name}"}"

			# Bare clone and permanent tree setup
			git -C "${perm_repo%"/${repo_name}"}" clone-bare "https://${repo_path}"
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
if   [[ -d "${repo_tree_e}/HOME/profile.d" ]]
then
	if   ! grep -F 'for f in "'"${repo_tree_f}"'/HOME/profile.d/"*.profile' "${HOME}/.profile" > /dev/null 2>&1
	then
		echo 'Adding .profile configuration'
		# shellcheck disable=2016
		echo '
	for f in "'"${repo_tree_f}"'/HOME/profile.d/"*.profile
	do
		source "${f}"
	done' >> "${HOME}/.profile"
	else
		echo 'Skipping .profile configuration'
	fi
else
	echo 'Skipping .profile configuration, no HOME/profile.d/'
fi

# Update .bashrc if needed
if   [[ -d "${repo_tree_e}/HOME/bashrc.d" ]]
then
	if   ! grep -F 'for f in "'"${repo_tree_f}"'/HOME/bashrc.d/"*.bash' "${HOME}/.bashrc" > /dev/null 2>&1
	then
		echo 'Adding .bashrc configuration'
		# shellcheck disable=2016
		echo '
	for f in "'"${repo_tree_f}"'/HOME/bashrc.d/"*.bash
	do
		source "${f}"
	done' >> "${HOME}/.bashrc"
	else
		echo 'Skipping .bashrc configuration'
	fi
else
	echo 'Skipping .bashrc configuration, no HOME/bashrc.d/'
fi

# BEGIN HOME

echo
for f in "${repo_tree_e}/HOME/".*
do
	bn="$(basename "${f}")"

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
				userskip "${bn}" "${f}" 'because there is no specific definition'
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
					userskip "${bn}" "${f}"
				;;
				*)
					userskip "${bn}" "${f}" 'because there is no specific definition'
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
	bn="$(basename "${f}")"

	# Exclude for non-users
	if   (( EUID < 1000 ))
	then
		case "${bn}" in
			dconf | dolphinrc | kate | klipperrc | knighttimerc | konsole* | ksmserverrc | osc | plasma*)
				userskip "${bn}" "${f}" "for EUID ${EUID}"
				continue
			;;
		esac
	fi

	if   [[ -f "${f}" ]]
	then
		# NOTE: Special cases
		case "${bn}" in
			dolphinrc)
				userlink_on_exec "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}" dolphin
			;;
			bash_completion)
				userlink_on_exec "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}" bash
			;;
			klipperrc | knighttimerc | plasma-nm)
				userlink_on_exec "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}" plasmashell
			;;
			konsolerc)
				userlink_on_exec "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}" konsole
			;;
			ksmserverrc)
				userlink_on_exec "${bn}" "${f}" "${XDG_CONFIG_HOME_local}/${bn}" ksmserver
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
	bn="$(basename "${f}")"

	# Exclude for non-users
	if   (( EUID < 1000 ))
	then
		case "${bn}" in
			konsole | kxmlgui5 | org.kde.syntax-highlighting)
				userskip "${bn}" "${f}" "for EUID ${EUID}"
				continue
			;;
		esac
	fi

	if   [[ -d "${f}" ]]
	then
		if   [[ -x "${f}/.setup.bash" ]]
		then
			echo "Delegating to ${f}/.setup.bash"
			"${f}/.setup.bash" "${domain}" "${f}" "${XDG_DATA_HOME_local}/${bn}"
			echo "Finished with ${f}/.setup.bash"
		else
			# NOTE: Special cases
			case "${bn}" in
				applications)
					userskip "${bn}" "${f}" 'configure manually'
				;;
				bash-completion)
					userskip "${bn}" "${f}" 'use BASH_COMPLETION_USER_DIR'
				;;
				org.kde.syntax-highlighting)
					userskip "${bn}" "${f}" 'configure manually'
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

if [[ -d "${repo_tree_e}/XDG_CONFIG_HOME/bat/syntaxes" || -d "${repo_tree_e}/XDG_CONFIG_HOME/bat/themes" ]]
then
	echo

	XDG_CACHE_HOME_local="${XDG_CACHE_HOME:-${HOME}/.cache}"

	if   type -fP 'bat' > '/dev/null' 2>&1
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
fi

# END   Generated content
