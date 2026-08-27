if   type pip3 > '/dev/null' 2>&1 || type pip > /dev/null 2>&1
then
	export PYTHONUSERBASE="${HOME}/pip"

	case ":${PATH}:" in
		*:${PYTHONUSERBASE}/bin:* | *:${PYTHONUSERBASE}/bin/:* )
			:
		;;
		*)
			# Prefix
			export PATH="${PYTHONUSERBASE}/bin:${PATH}"
		;;
	esac

	case ":${MANPATH}:" in
		*:${PYTHONUSERBASE}/share/man:* | *:${PYTHONUSERBASE}/share/man/:* )
			:
		;;
		*)
			# Prefix
			export MANPATH="${PYTHONUSERBASE}/share/man:${MANPATH}"
		;;
	esac
fi
