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

	if   [ "${npm_prefix}" -eq "${HOME}/${npm_prefix#${HOME}/}" ]
	then
		echo ":${PATH}:" | grep -E ":${npm_prefix}/bin/?:" > '/dev/null' \
		|| export PATH="${npm_prefix}/bin:${PATH}"
	fi
fi
