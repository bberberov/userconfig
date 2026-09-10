#! /usr/bin/env bash

# Copyright © 2026 Boian Berberov
#
# Licensed under the EUPL-1.2 only.
# License text: https://joinup.ec.europa.eu/collection/eupl/eupl-text-eupl-12
# SPDX-License-Identifier: EUPL-1.2

function dry_mv()
{
	if   (( 0 < opt_dry ))
	then
		parent="$(realpath --canonicalize-missing "${tgt_full_dir}/..")"
		[[ ! -d "${parent}" ]] && mkdir -p "${parent}"

		mv "${cur_full_dir}" "${tgt_full_dir}"
	fi
}

opt_dry=1
[[ '--dry-run' == "${1}" ]] && opt_dry=0

sep='@'

# MUSIC
# PICTURES
# PUBLICSHARE
# VIDEOS

for dir_map in \
	  "DESKTOP${sep}${HOME}/user/desk" \
	"DOCUMENTS${sep}/srv/user/${USER}/archive" \
	 "DOWNLOAD${sep}/srv/user/${USER}/inbox/download" \
	"TEMPLATES${sep}${HOME}/user/templates" \
	 "PROJECTS${sep}${HOME}/user/project" \
;
do
	cur_name="${dir_map%%"${sep}"*}"
	cur_full_dir="$(xdg-user-dir "${cur_name}")"
	tgt_full_dir="${dir_map#"${cur_name}${sep}"}"

	if   [[ "${cur_full_dir}" != "${tgt_full_dir}" ]]
	then
		if   [[ -d "${cur_full_dir}" ]]
		then
			if   [[ -d "${tgt_full_dir}" ]]
			then
				if   [[ -z "$(command ls -Aq "${cur_full_dir}")" ]]
				then
					echo -e "\e[34m${cur_full_dir}\e[0m is empty, \e[34m${tgt_full_dir}\e[0m exists, \e[33mremoving\e[0m \e[34m${cur_full_dir}\e[0m"
					(( 0 < opt_dry )) && rmdir "${cur_full_dir}"
				else
					if   [[ -z "$(command ls -Aq "${tgt_full_dir}")" ]]
					then
						echo -e "\e[34m${cur_full_dir}\e[0m is not empty, \e[34m${tgt_full_dir}\e[0m is empty, \e[36mclobbering\e[0m"
						dry_mv "${cur_full_dir}" "${tgt_full_dir}"
					else
						echo -e "Both \e[34m${cur_full_dir}\e[0m and \e[34m${tgt_full_dir}\e[0m are not empty, \e[31mskipping\e[0m"
						continue
					fi
				fi
			else
				echo -e "\e[34m${cur_full_dir}\e[0m exists, \e[34m${tgt_full_dir}\e[0m does not exist, \e[36mmoving\e[0m"
				dry_mv "${cur_full_dir}" "${tgt_full_dir}"
			fi
		else
			echo -e "\e[34m${cur_full_dir}\e[0m does not exist, \e[36musing\e[0m \e[34m${tgt_full_dir}\e[0m"
			(( 0 < opt_dry )) && [[ ! -d "${tgt_full_dir}" ]] && mkdir -p "${tgt_full_dir}"
		fi

		(( 0 < opt_dry )) && xdg-user-dirs-update --set "${cur_name}" "${tgt_full_dir}"
	else
		echo -e "\e[34m${cur_name}\e[0m is already \e[34m${tgt_full_dir}\e[0m"
	fi
done
