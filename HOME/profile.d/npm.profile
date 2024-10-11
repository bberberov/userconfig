npm_prefix=`npm config get prefix`

if 	echo "${npm_prefix}" | grep "^${HOME}" > /dev/null
then
	echo ":${PATH}:" | grep -E ":${npm_prefix}/bin/?:" > /dev/null \
	|| export PATH="${npm_prefix}/bin:${PATH}"
fi

unset npm_prefix
