export HISTSIZE=3000

### BEGIN XDG

XDG_CACHE_HOME_local="${XDG_CACHE_HOME:-${HOME}/.cache}"
XDG_CONFIG_HOME_local="${XDG_CONFIG_HOME:-${HOME}/.config}"
XDG_DATA_HOME_local="${XDG_DATA_HOME:-${HOME}/.local/share}"
XDG_STATE_HOME_local="${XDG_STATE_HOME:-${HOME}/.local/state}"

# rg
RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME_local}/rg/config"

if   [ -r "${RIPGREP_CONFIG_PATH}" ]
then
	export RIPGREP_CONFIG_PATH
else
	unset RIPGREP_CONFIG_PATH
fi

# wget
WGETRC="${XDG_CONFIG_HOME_local}/wget/wgetrc"

if   [ -r "${WGETRC}" ]
then
	export WGETRC
else
	unset WGETRC
fi

unset XDG_CACHE_HOME_local
unset XDG_CONFIG_HOME_local
unset XDG_DATA_HOME_local
unset XDG_STATE_HOME_local

### END   XDG

if   [ -z "${BASH_VERSION:-}" ] && [ -z "${ZSH_VERSION:-}" ]
then
	case "${-:-}" in *i* )  # BEGIN Interactive only
		[ -f "${HOME}/.shrc" ] && export ENV="${HOME}/.shrc"
	;; esac                 # END   Interactive only
fi
