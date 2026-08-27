if   type 'npm' > '/dev/null' 2>&1
then
	if   type 'sed' > '/dev/null' 2>&1 && type 'envsubst' > '/dev/null' 2>&1
	then
		# NOTE: It's +20x faster <shrug>
		npm_prefix="$(command sed -ne '/^prefix[[:space:]]*=/{ s/^prefix[[:space:]]*=[[:space:]]*//; p; }' "${HOME}/.npmrc" | command envsubst)"
		npm_prefix=${npm_prefix#\"}
		npm_prefix=${npm_prefix%\"}
	else
		npm_prefix="$(command npm config get prefix)"
	fi

	if   [ "${npm_prefix}" = "${HOME}/${npm_prefix#"${HOME}/"}" ]
	then
		case ":${PATH}:" in
			*:${npm_prefix}/bin:* | *:${npm_prefix}/bin/:* )
				:
			;;
			*)
				# Prefix
				export PATH="${npm_prefix}/bin:${PATH}"
			;;
		esac
	fi
fi
