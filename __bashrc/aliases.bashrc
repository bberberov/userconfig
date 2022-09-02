# cd
alias     cd..='cd ..'
alias    cd...='cd ../..'
alias   cd....='cd ../../..'
alias  cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

# df
if which df > /dev/null 2>&1
then
	if df --version | grep GNU > /dev/null
	then
		alias df-all='df -h --output=source,fstype,size,used,avail,pcent,itotal,iused,iavail,ipcent,file,target'
	else
		alias     df='df -Pk'
		alias df-all='df -h'
	fi
fi

# exa
if which exa > /dev/null 2>&1
then
	alias    exa='exa -bg'
	alias  exa-x='exa -bg --sort=extension --group-directories-first'
	alias   lexa='exa -lbg'
	alias lexa-x='exa -lbg --sort=extension --group-directories-first'
	alias  exalt='exa -lbg -T'

	for (( num = 2; num < 10; num += 1 ))
	do
		alias   "exa${num}"="exa -T -L ${num}"
		alias "exalt${num}"="exa -lbg -T -L ${num}"
	done
fi

# grep
if which grep > /dev/null 2>&1
then
	alias        grep='grep --color=auto'
	alias  grep-color='grep --color=always'
	alias       Egrep='grep --color=auto -E'
	alias Egrep-color='grep --color=always -E'
	alias       Fgrep='grep --color=auto -F'
	alias Fgrep-color='grep --color=always -F'
	alias       Sgrep='grep --color=auto -F'
	alias Sgrep-color='grep --color=always -F'
fi

# ip
if which ip > /dev/null 2>&1
then
	alias           ip='ip --color=auto'
	alias     ip-color='ip --color=always'

	alias       ipaddr='ip --color=auto -brief addr'
	alias       iplink='ip --color=auto -brief link'
	alias ipaddr-color='ip --color=always -brief addr'
	alias iplink-color='ip --color=always -brief link'

	alias          ip4='ip --color=auto -4'
	alias         ip4a='ip --color=auto -4 -brief addr'
	alias    ip4-color='ip --color=always -4'
	alias   ip4a-color='ip --color=always -4 -brief addr'

	alias          ip6='ip --color=auto -6'
	alias         ip6a='ip --color=auto -6 -brief addr'
	alias    ip6-color='ip --color=always -6'
	alias   ip6a-color='ip --color=always -6 -brief addr'
fi

# ls
if which ls > /dev/null 2>&1
then
	alias          ls='ls --color=auto'
	alias    ls-color='ls --color=always'

	alias          la='ls --color=auto -a'
	alias          l1='ls --color=auto -1'
	alias          lx='ls --color=auto -X --group-directories-first'
	alias         lax='ls --color=auto -aX --group-directories-first'
	alias    la-color='ls --color=always -a'
	alias    l1-color='ls --color=always -1'
	alias    lx-color='ls --color=always -X --group-directories-first'
	alias   lax-color='ls --color=always -aX --group-directories-first'

	alias          ll='ls --color=auto -l'
	alias         lla='ls --color=auto -la'
	alias         llx='ls --color=auto -lX --group-directories-first'
	alias        llax='ls --color=auto -lX --group-directories-first'
	alias    ll-color='ls --color=always -l'
	alias   lla-color='ls --color=always -la'
	alias   llx-color='ls --color=always -lX --group-directories-first'
	alias  llax-color='ls --color=always -lX --group-directories-first'

	alias       llrth='ls --color=auto -lrth'
	alias       llrsh='ls --color=auto -lrSh'
	alias       larth='ls --color=auto -larth'
	alias       larsh='ls --color=auto -larSh'
	alias llrth-color='ls --color=always -lrth'
	alias llrsh-color='ls --color=always -lrSh'
	alias larth-color='ls --color=always -larth'
	alias larsh-color='ls --color=always -larSh'
fi

# sed
if which sed > /dev/null 2>&1
then
	alias Esed='sed -E'
fi

# tree
if which tree > /dev/null 2>&1
then
	alias ltree='tree -pugshD'

	for (( num = 2; num < 10; num += 1 ))
	do
		alias  "tree${num}"="tree -L ${num}"
		alias "ltree${num}"="tree -L ${num} -pugshD"
	done
fi
