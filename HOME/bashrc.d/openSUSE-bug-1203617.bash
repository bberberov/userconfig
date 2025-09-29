if   [[ -f /etc/os-release ]] && grep 'https://www.opensuse.org' /etc/os-release > /dev/null 2>&1
then
	# BUG: https://bugzilla.suse.com/show_bug.cgi?id=1203617
	#
	# Should be sourced in bashrc

	if   [[ -f '/etc/profile.d/lmod.sh' ]]
	then
		source '/etc/profile.d/lmod.sh'
	elif [[ -f '/etc/profile.d/modules.sh' ]]
	then
		source '/etc/profile.d/modules.sh'
	fi

	if   [[ -f '/etc/profile.d/fzf-bash.sh' ]]
	then
		source '/etc/profile.d/fzf-bash.sh'
	elif [[ -f '/etc/profile.d/skim-bash-integration.sh' ]]
	then
		source '/etc/profile.d/skim-bash-integration.sh'
	fi
fi
