user_man="${XDG_DATA_HOME:-${HOME}.local/share}/man"

if   [ -d "${user_man}" ]
then
	echo ":${MANPATH}:" | grep -E ":${user_man}/?:" > /dev/null \
	|| export MANPATH="${user_man}:${MANPATH}"
fi

unset user_man
