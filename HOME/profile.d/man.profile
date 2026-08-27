user_man="${XDG_DATA_HOME:-${HOME}.local/share}/man"

if   [ -d "${user_man}" ]
then
	case ":${MANPATH}:" in
		*:${user_man}:* | *:${user_man}/:* )
			:
		;;
		*)
			# Suffix
			export MANPATH="${MANPATH}:${user_man}"
		;;
	esac
fi

unset user_man
