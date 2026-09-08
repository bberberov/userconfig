case "${-:-}" in *i* )  # BEGIN Interactive only

export MANOPT='--no-justification --no-hyphenation'

case "${TERM}" in
	*konsole*   |\
	xterm*      \
	)
		export MANROFFOPT='-P -i'
	;;
esac

alias man='MANWIDTH="$(( COLUMNS <= 120 ? COLUMNS : 120 ))" man'

;; esac                 # END   Interactive only
