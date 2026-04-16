RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME:-${HOME}/.config}/rg/config"

if   [ -r "${RIPGREP_CONFIG_PATH}" ]
then
	export RIPGREP_CONFIG_PATH
else
	unset RIPGREP_CONFIG_PATH
fi
