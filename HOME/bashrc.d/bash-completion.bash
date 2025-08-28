if   which realpath > /dev/null 2>&1 && which dirname > /dev/null 2>&1
then
	bash_completion_dir="$( realpath "$( dirname "${BASH_SOURCE[0]}" )"'/../../XDG_DATA_HOME/bash-completion/.' )"

	if   [[ -v BASH_COMPLETION_USER_DIR && -d "${bash_completion_dir}" ]]
	then
		[[ ":${BASH_COMPLETION_USER_DIR}:" =~ ":${bash_completion_dir}"/?':' ]] \
		|| export BASH_COMPLETION_USER_DIR="${BASH_COMPLETION_USER_DIR}:${bash_completion_dir}"
	else
		export BASH_COMPLETION_USER_DIR="${bash_completion_dir}"
	fi
fi
