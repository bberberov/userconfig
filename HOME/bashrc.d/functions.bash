#! /usr/bin/env bash

# Copyright © 2026 Boian Berberov
#
# Licensed under the EUPL-1.2 only.
# License text: https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12
# SPDX-License-Identifier: EUPL-1.2

fn_cd_if_exists()
{
	if   [[ -d "${1}" ]]
	then
		cd "${1}" || return 1
	else
		return 1
	fi
}

fn_cd_config()
{
	if   [[ -n "${1}" ]]
	then
		case "${1}" in
			flatpak)
				fn_cd_if_exists "${HOME}/.var/app"
			;;
			freeciv)
				fn_cd_if_exists "${HOME}/.freeciv"
			;;
			ssh)
				fn_cd_if_exists "${HOME}/.ssh"
			;;
		esac
	fi

	return $?
}

fn_cd_user()
{
	if   [[ -n "${1}" ]]
	then
		case "${1}" in
			archive)
				fn_cd_if_exists "/srv/user/${USER}/archive"
			;;
			config)
				fn_cd_if_exists "${HOME}/user/config"
			;;
			desk)
				fn_cd_if_exists "${HOME}/user/desk"
			;;
			exec)
				fn_cd_if_exists "${HOME}/user/exec"
			;;
			inbox)
				fn_cd_if_exists "/srv/user/${USER}/inbox"
			;;
			obs)
				fn_cd_if_exists "/srv/user/${USER}/obs"
			;;
			pim)
				fn_cd_if_exists "/srv/user/${USER}/pim"
			;;
			project)
				fn_cd_if_exists "${HOME}/user/project"
			;;
			srv)
				fn_cd_if_exists "/srv/user/${USER}"
			;;
			vcs)
				fn_cd_if_exists "/srv/user/${USER}/vcs"
			;;
		esac
	else
		fn_cd_if_exists "${HOME}/user"
	fi

	return $?
}

if   type -fP 'git' > '/dev/null' 2>&1
then
	fn_cd_git_repo()
	{
		local r rval
		r="$(git rev-parse --git-common-dir 2> /dev/null)"
		rval=$?

		if   [[ -n "${r}" ]]
		then
			cd "${r}/" || return 205
		else
			return ${rval}
		fi
	}

	fn_cd_git_tree()
	{
		local rval

		if   [[ -f 'gitdir' ]]
		then
			cd-file-gitdir
		else
			local t
			t="$(git rev-parse --show-toplevel 2> '/dev/null')"
			rval=$?

			if   [[ -n "${t}" ]]
			then
				cd "${t}" || return 205
			else
				local r
				r="$(git rev-parse --git-common-dir 2> /dev/null)"
				rval=$?

				if   (( 0 == rval ))
				then
					local w
					w="$(ls -1 "${r}/worktrees/" 2> /dev/null)"
					rval=$?

					if   (( 0 == rval ))
					then
						local wn
						wn="$(echo "${w}" | wc -l 2> /dev/null)"
						rval=$?

						if   (( 1 == wn )) && [[ -f "${r}/worktrees/${w}/gitdir" ]]
						then
							fn_cd_file_gitdir "${r}/worktrees/${w}/gitdir"
						else
							echo 'fatal: no single worktree configuration directory found' > /dev/stderr
							return 1
						fi
					else
						echo 'fatal: failed to find worktree configuration directories' > /dev/stderr
						return ${rval}
					fi
				else
					echo 'fatal: this operation must be run in a worktree or a repo' > /dev/stderr
					return ${rval}
				fi
			fi
		fi
	}
fi

if   type -fP 'sed' > '/dev/null' 2>&1
then
	fn_cd_file_gitdir()
	{
		local p rval

		p="$(sed -e 's:/\.git$::' "${1:-gitdir}" 2> '/dev/null')"
		rval=$?

		if   (( 0 == rval ))
		then
			cd "${p}" || return 205
		else
			return ${rval}
		fi
	}

	fn_cd_file_.git()
	{
		local p rval

		p="$(sed -e 's@^gitdir: /@/@' "${1:-.git}" 2> '/dev/null')"
		rval=$?

		if   (( 0 == rval ))
		then
			cd "${p}" || return 205
		else
			return ${rval}
		fi
	}
else
	fn_cd_file_gitdir()
	{
		return 255
	}
	fn_cd_file_.git()
	{
		return 255
	}
fi


if   type -fP 'xdg-user-dir' > '/dev/null' 2>&1
then
	fn_cd_xdg()
	{
		if   [[ -n "${1}" ]]
		then
			case "${1}" in
				desktop)
					fn_cd_if_exists "$(xdg-user-dir DESKTOP)"
				;;
				documents)
					fn_cd_if_exists "$(xdg-user-dir DOCUMENTS)"
				;;
				download)
					fn_cd_if_exists "$(xdg-user-dir DOWNLOAD)"
				;;
				music)
					fn_cd_if_exists "$(xdg-user-dir MUSIC)"
				;;
				pictures)
					fn_cd_if_exists "$(xdg-user-dir PICTURES)"
				;;
				publicshare)
					fn_cd_if_exists "$(xdg-user-dir PUBLICSHARE)"
				;;
				templates)
					fn_cd_if_exists "$(xdg-user-dir TEMPLATES)"
				;;
				videos)
					fn_cd_if_exists "$(xdg-user-dir VIDEOS)"
				;;

				cache)
					fn_cd_if_exists "${XDG_CACHE_HOME:-"${HOME}/.cache"}"
				;;
				config)
					fn_cd_if_exists "${XDG_CONFIG_HOME:-"${HOME}/.config"}"
				;;
				data)
					fn_cd_if_exists "${XDG_DATA_HOME:-"${HOME}/.local/share"}"
				;;
				runtime)
					fn_cd_if_exists "${XDG_RUNTIME_DIR}"
				;;
				state)
					fn_cd_if_exists "${XDG_STATE_HOME:-"${HOME}/.local/state"}"
				;;
			esac
		fi

		return $?
	}
else
	fn_cd_xdg()
	{
		if   [[ -n "${1}" ]]
		then
			case "${1}" in
				cache)
					fn_cd_if_exists "${XDG_CACHE_HOME:-"${HOME}/.cache"}"
				;;
				config)
					fn_cd_if_exists "${XDG_CONFIG_HOME:-"${HOME}/.config"}"
				;;
				data)
					fn_cd_if_exists "${XDG_DATA_HOME:-"${HOME}/.local/share"}"
				;;
				runtime)
					fn_cd_if_exists "${XDG_RUNTIME_DIR}"
				;;
				state)
					fn_cd_if_exists "${XDG_STATE_HOME:-"${HOME}/.local/state"}"
				;;
			esac
		fi

		return $?
	}
fi
