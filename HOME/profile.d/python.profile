if   type pip3 > '/dev/null' 2>&1 || type pip > /dev/null 2>&1
then
	export PYTHONUSERBASE="${HOME}/pip"

	echo ":${PATH}:" | grep -E ":${PYTHONUSERBASE}/bin/?:" > '/dev/null' \
	|| export PATH="${PYTHONUSERBASE}/bin:${PATH}"

	echo ":${MANPATH}:" | grep -E ":${PYTHONUSERBASE}/share/man/?:" > '/dev/null' \
	|| export MANPATH="${PYTHONUSERBASE}/share/man:${MANPATH}"
fi
