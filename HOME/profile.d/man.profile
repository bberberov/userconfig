user_man="${XDG_DATA_HOME:-${HOME}.local/share}/man"

if   [ -d "${user_man}" ]
then
	echo ":${MANPATH}:" | grep -E ":${user_man}/?:" > /dev/null \
	|| export MANPATH="${MANPATH}:${user_man}"
fi

unset user_man
