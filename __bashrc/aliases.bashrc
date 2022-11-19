# cd
alias     cd..='cd ..'
alias    cd...='cd ../..'
alias   cd....='cd ../../..'
alias  cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

# df
if   which df > /dev/null 2>&1
then
	if   df --version | grep GNU > /dev/null
	then
		alias   df-all='df -h --output=source,fstype,size,used,avail,pcent,itotal,iused,iavail,ipcent,file,target'
		alias  df-free='df -h --output=source,itotal,iavail,size,avail,target'
		alias df-pcent='df -h --output=source,ipcent,pcent,target'
	else
		alias       df='df -Pk'
		alias   df-all='df -h'
	fi
fi

# exa
if   which exa > /dev/null 2>&1
then
	alias    exa='exa -bg'
	alias  exa-x='exa -bg --sort=extension --group-directories-first'
	alias   lexa='exa -lbg'
	alias lexa-x='exa -lbg --sort=extension --group-directories-first'
	alias  exalt='exa -lbg -T'

	for (( i=2 ; i < 10 ; i+=1 ))
	do
		alias   "exa${i}"="exa -T -L ${i}"
		alias "exalt${i}"="exa -lbg -T -L ${i}"
	done
fi

# grep
if   which grep > /dev/null 2>&1
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
if   which ip > /dev/null 2>&1
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
if   which ls > /dev/null 2>&1
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

	alias          ll='ls --color=auto -lh'
	alias         lla='ls --color=auto -lah'
	alias         llx='ls --color=auto -lXh --group-directories-first'
	alias        llax='ls --color=auto -laXh --group-directories-first'
	alias    ll-color='ls --color=always -lh'
	alias   lla-color='ls --color=always -lah'
	alias   llx-color='ls --color=always -lXh --group-directories-first'
	alias  llax-color='ls --color=always -laXh --group-directories-first'
	alias         llB='ls --color=auto -l'
	alias        llaB='ls --color=auto -la'
	alias        llxB='ls --color=auto -lX --group-directories-first'
	alias       llaxB='ls --color=auto -laX --group-directories-first'
	alias   llB-color='ls --color=always -l'
	alias  llaB-color='ls --color=always -la'
	alias  llxB-color='ls --color=always -lX --group-directories-first'
	alias llaxB-color='ls --color=always -laX --group-directories-first'
	alias         llK='ls --color=auto -l --block-size=1K'
	alias        llaK='ls --color=auto -la --block-size=1K'
	alias        llxK='ls --color=auto -lX --group-directories-first --block-size=1K'
	alias       llaxK='ls --color=auto -laX --group-directories-first --block-size=1K'
	alias   llK-color='ls --color=always -l --block-size=1K'
	alias  llaK-color='ls --color=always -la --block-size=1K'
	alias  llxK-color='ls --color=always -lX --group-directories-first --block-size=1K'
	alias llaxK-color='ls --color=always -laX --group-directories-first --block-size=1K'
	alias         llM='ls --color=auto -l --block-size=1M'
	alias        llaM='ls --color=auto -la --block-size=1M'
	alias        llxM='ls --color=auto -lX --group-directories-first --block-size=1M'
	alias       llaxM='ls --color=auto -laX --group-directories-first --block-size=1M'
	alias   llM-color='ls --color=always -l --block-size=1M'
	alias  llaM-color='ls --color=always -la --block-size=1M'
	alias  llxM-color='ls --color=always -lX --group-directories-first --block-size=1M'
	alias llaxM-color='ls --color=always -laX --group-directories-first --block-size=1M'
	alias         llG='ls --color=auto -l --block-size=1G'
	alias        llaG='ls --color=auto -la --block-size=1G'
	alias        llxG='ls --color=auto -lX --group-directories-first --block-size=1G'
	alias       llaxG='ls --color=auto -laX --group-directories-first --block-size=1G'
	alias   llG-color='ls --color=always -l --block-size=1G'
	alias  llaG-color='ls --color=always -la --block-size=1G'
	alias  llxG-color='ls --color=always -lX --group-directories-first --block-size=1G'
	alias llaxG-color='ls --color=always -laX --group-directories-first --block-size=1G'
	alias         llT='ls --color=auto -l --block-size=1T'
	alias        llaT='ls --color=auto -la --block-size=1T'
	alias        llxT='ls --color=auto -lX --group-directories-first --block-size=1T'
	alias       llaxT='ls --color=auto -laX --group-directories-first --block-size=1T'
	alias   llT-color='ls --color=always -l --block-size=1T'
	alias  llaT-color='ls --color=always -la --block-size=1T'
	alias  llxT-color='ls --color=always -lX --group-directories-first --block-size=1T'
	alias llaxT-color='ls --color=always -laX --group-directories-first --block-size=1T'
	alias         llP='ls --color=auto -l --block-size=1P'
	alias        llaP='ls --color=auto -la --block-size=1P'
	alias        llxP='ls --color=auto -lX --group-directories-first --block-size=1P'
	alias       llaxP='ls --color=auto -laX --group-directories-first --block-size=1P'
	alias   llP-color='ls --color=always -l --block-size=1P'
	alias  llaP-color='ls --color=always -la --block-size=1P'
	alias  llxP-color='ls --color=always -lX --group-directories-first --block-size=1P'
	alias llaxP-color='ls --color=always -laX --group-directories-first --block-size=1P'

	alias       llrth='ls --color=auto -lrth'
	alias       llrsh='ls --color=auto -lrSh'
	alias       larth='ls --color=auto -larth'
	alias       larsh='ls --color=auto -larSh'
	alias llrth-color='ls --color=always -lrth'
	alias llrsh-color='ls --color=always -lrSh'
	alias larth-color='ls --color=always -larth'
	alias larsh-color='ls --color=always -larSh'

	alias         lss='ls --color=auto -sh'
	alias        lssB='ls --color=auto -s'
	alias        lssK='ls --color=auto -s --block-size=1K'
	alias        lssM='ls --color=auto -s --block-size=1M'
	alias        lssG='ls --color=auto -s --block-size=1G'
	alias        lssT='ls --color=auto -s --block-size=1T'
	alias        lssP='ls --color=auto -s --block-size=1P'
	alias   lss-color='ls --color=always -sh'
	alias  lssB-color='ls --color=always -s'
	alias  lssK-color='ls --color=always -s --block-size=1K'
	alias  lssM-color='ls --color=always -s --block-size=1M'
	alias  lssG-color='ls --color=always -s --block-size=1G'
	alias  lssT-color='ls --color=always -s --block-size=1T'
	alias  lssP-color='ls --color=always -s --block-size=1P'
fi

# sed
if   which sed > /dev/null 2>&1
then
	alias Esed='sed -E'
fi

# tree
if   which tree > /dev/null 2>&1
then
	alias ltree='tree -pugshD'

	for (( i=2 ; i < 10 ; i+=1 ))
	do
		alias  "tree${i}"="tree -L ${i}"
		alias "ltree${i}"="tree -L ${i} -pugshD"
	done
fi

# Custom
alias list-path='echo $PATH | sed -e "s/:/\n/g"'
alias separator='echo; for (( i=0 ; i < ${COLUMNS} ; i+=1 )); do echo -n "="; done; echo; echo'
