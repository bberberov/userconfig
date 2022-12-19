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
		alias    df-all='df -h --output=source,fstype,size,used,avail,pcent,itotal,iused,iavail,ipcent,file,target'
		alias   df-full='df -h --output=source,itotal,iused,ipcent,iavail,target,size,used,pcent,avail'
		alias df-blocks='df -h --output=source,target,size,used,pcent,avail'
		alias df-inodes='df -h --output=source,target,itotal,iused,ipcent,iavail'
		alias   df-free='df -h --output=source,target,iavail,avail'
		alias   df-fill='df -h --output=source,target,ipcent,pcent'
	else
		alias        df='df -Pk'
		alias    df-all='df -h'
	fi
fi

# exa
if   which exa > /dev/null 2>&1
then
	alias   exa='exa --group-directories-first'
	alias  lexa='exa --group-directories-first -lbg'
	alias  texa='exa --group-directories-first -T'
	alias exalt='exa --group-directories-first -lbg -T'

	for (( i=2 ; i < 10 ; i+=1 ))
	do
		alias  "texa${i}"="exa --group-directories-first -T -L ${i}"
		alias "exalt${i}"="exa --group-directories-first -lbg -T -L ${i}"
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
	alias            ip='ip --color=auto'
	alias           ip4='ip --color=auto -4'
	alias           ip6='ip --color=auto -6'
	alias        iplink='ip --color=auto -brief link'
	alias        ipaddr='ip --color=auto -brief addr'
	alias       ip4addr='ip --color=auto -4 -brief addr'
	alias       ip6addr='ip --color=auto -6 -brief addr'
	alias      ip-color='ip --color=always'
	alias     ip4-color='ip --color=always -4'
	alias     ip6-color='ip --color=always -6'
	alias  iplink-color='ip --color=always -brief link'
	alias  ipaddr-color='ip --color=always -brief addr'
	alias ip4addr-color='ip --color=always -4 -brief addr'
	alias ip6addr-color='ip --color=always -6 -brief addr'
fi

# ls
if   which ls > /dev/null 2>&1
then
	# ls base
	alias           ls='ls --color=auto'
	alias          lsx='ls --color=auto -X --group-directories-first'

	alias          lss='ls --color=auto -sh'
	alias         lssB='ls --color=auto -s'
	alias         lssK='ls --color=auto -s --block-size=1K'
	alias         lssM='ls --color=auto -s --block-size=1M'
	alias         lssG='ls --color=auto -s --block-size=1G'

	alias         lsss='ls --color=auto -shS'
	alias        lsssB='ls --color=auto -sS'
	alias        lsssK='ls --color=auto -sS --block-size=1K'
	alias        lsssM='ls --color=auto -sS --block-size=1M'
	alias        lsssG='ls --color=auto -sS --block-size=1G'

	alias         lssx='ls --color=auto -shX --group-directories-first'
	alias        lssxB='ls --color=auto -sX --group-directories-first'
	alias        lssxK='ls --color=auto -sX --group-directories-first --block-size=1K'
	alias        lssxM='ls --color=auto -sX --group-directories-first --block-size=1M'
	alias        lssxG='ls --color=auto -sX --group-directories-first --block-size=1G'

	alias     ls-color='ls --color=always'
	alias    lsx-color='ls --color=always -X --group-directories-first'

	alias    lss-color='ls --color=always -sh'
	alias   lssB-color='ls --color=always -s'
	alias   lssK-color='ls --color=always -s --block-size=1K'
	alias   lssM-color='ls --color=always -s --block-size=1M'
	alias   lssG-color='ls --color=always -s --block-size=1G'

	alias   lsss-color='ls --color=always -shS'
	alias  lsssB-color='ls --color=always -sS'
	alias  lsssK-color='ls --color=always -sS --block-size=1K'
	alias  lsssM-color='ls --color=always -sS --block-size=1M'
	alias  lsssG-color='ls --color=always -sS --block-size=1G'

	alias   lssx-color='ls --color=always -shX --group-directories-first'
	alias  lssxB-color='ls --color=always -sX --group-directories-first'
	alias  lssxK-color='ls --color=always -sX --group-directories-first --block-size=1K'
	alias  lssxM-color='ls --color=always -sX --group-directories-first --block-size=1M'
	alias  lssxG-color='ls --color=always -sX --group-directories-first --block-size=1G'

	# la base
	alias           la='ls --color=auto -a'
	alias          lax='ls --color=auto -aX --group-directories-first'

	alias          las='ls --color=auto -ash'
	alias         lasB='ls --color=auto -as'
	alias         lasK='ls --color=auto -as --block-size=1K'
	alias         lasM='ls --color=auto -as --block-size=1M'
	alias         lasG='ls --color=auto -as --block-size=1G'

	alias         lass='ls --color=auto -ashS'
	alias        lassB='ls --color=auto -asS'
	alias        lassK='ls --color=auto -asS --block-size=1K'
	alias        lassM='ls --color=auto -asS --block-size=1M'
	alias        lassG='ls --color=auto -asS --block-size=1G'

	alias         lasx='ls --color=auto -ashX'
	alias        lasxB='ls --color=auto -asX'
	alias        lasxK='ls --color=auto -asX --block-size=1K'
	alias        lasxM='ls --color=auto -asX --block-size=1M'
	alias        lasxG='ls --color=auto -asX --block-size=1G'

	alias     la-color='ls --color=always -a'
	alias    lax-color='ls --color=always -aX --group-directories-first'

	alias    las-color='ls --color=always -ash'
	alias   lasB-color='ls --color=always -as'
	alias   lasK-color='ls --color=always -as --block-size-color=1K'
	alias   lasM-color='ls --color=always -as --block-size-color=1M'
	alias   lasG-color='ls --color=always -as --block-size-color=1G'

	alias   lass-color='ls --color=always -ashS'
	alias  lassB-color='ls --color=always -asS'
	alias  lassK-color='ls --color=always -asS --block-size-color=1K'
	alias  lassM-color='ls --color=always -asS --block-size-color=1M'
	alias  lassG-color='ls --color=always -asS --block-size-color=1G'

	alias   lasx-color='ls --color=always -ashX'
	alias  lasxB-color='ls --color=always -asX'
	alias  lasxK-color='ls --color=always -asX --block-size-color=1K'
	alias  lasxM-color='ls --color=always -asX --block-size-color=1M'
	alias  lasxG-color='ls --color=always -asX --block-size-color=1G'

	# l1 base
	alias           l1='ls --color=auto -1'
	alias          l1x='ls --color=auto -1X --group-directories-first'

	alias          l1a='ls --color=auto -1a'
	alias         l1ax='ls --color=auto -1aX --group-directories-first'

	alias          l1s='ls --color=auto -1sh'
	alias         l1sB='ls --color=auto -1s'
	alias         l1sK='ls --color=auto -1s --block-size=1K'
	alias         l1sM='ls --color=auto -1s --block-size=1M'
	alias         l1sG='ls --color=auto -1s --block-size=1G'

	alias         l1ss='ls --color=auto -1shS'
	alias        l1ssB='ls --color=auto -1sS'
	alias        l1ssK='ls --color=auto -1sS --block-size=1K'
	alias        l1ssM='ls --color=auto -1sS --block-size=1M'
	alias        l1ssG='ls --color=auto -1sS --block-size=1G'

	alias     l1-color='ls --color=always -1'
	alias    l1x-color='ls --color=always -1X --group-directories-first'

	alias    l1a-color='ls --color=always -1a'
	alias   l1ax-color='ls --color=always -1aX --group-directories-first'

	alias    l1s-color='ls --color=always -1sh'
	alias   l1sB-color='ls --color=always -1s'
	alias   l1sK-color='ls --color=always -1s --block-size=1K'
	alias   l1sM-color='ls --color=always -1s --block-size=1M'
	alias   l1sG-color='ls --color=always -1s --block-size=1G'

	alias   l1ss-color='ls --color=always -1shS'
	alias  l1ssB-color='ls --color=always -1sS'
	alias  l1ssK-color='ls --color=always -1sS --block-size=1K'
	alias  l1ssM-color='ls --color=always -1sS --block-size=1M'
	alias  l1ssG-color='ls --color=always -1sS --block-size=1G'

	# ll base
	alias           ll='ls --color=auto -lh'
	alias          llB='ls --color=auto -l'
	alias          llK='ls --color=auto -l --block-size=1K'
	alias          llM='ls --color=auto -l --block-size=1M'
	alias          llG='ls --color=auto -l --block-size=1G'

	alias          lls='ls --color=auto -lhS --group-directories-first'
	alias         llsB='ls --color=auto -lS --group-directories-first'
	alias         llsK='ls --color=auto -lS --group-directories-first --block-size=1K'
	alias         llsM='ls --color=auto -lS --group-directories-first --block-size=1M'
	alias         llsG='ls --color=auto -lS --group-directories-first --block-size=1G'

	alias          llt='ls --color=auto -lht --group-directories-first'
	alias         lltB='ls --color=auto -lt --group-directories-first'
	alias         lltK='ls --color=auto -lt --group-directories-first --block-size=1K'
	alias         lltM='ls --color=auto -lt --group-directories-first --block-size=1M'
	alias         lltG='ls --color=auto -lt --group-directories-first --block-size=1G'

	alias         llrs='ls --color=auto -lhrS --group-directories-first'
	alias        llrsB='ls --color=auto -lrS --group-directories-first'
	alias        llrsK='ls --color=auto -lrS --group-directories-first --block-size=1K'
	alias        llrsM='ls --color=auto -lrS --group-directories-first --block-size=1M'
	alias        llrsG='ls --color=auto -lrS --group-directories-first --block-size=1G'

	alias         llrt='ls --color=auto -lhrt --group-directories-first'
	alias        llrtB='ls --color=auto -lrt --group-directories-first'
	alias        llrtK='ls --color=auto -lrt --group-directories-first --block-size=1K'
	alias        llrtM='ls --color=auto -lrt --group-directories-first --block-size=1M'
	alias        llrtG='ls --color=auto -lrt --group-directories-first --block-size=1G'

	alias          llx='ls --color=auto -lhX --group-directories-first'
	alias         llxB='ls --color=auto -lX --group-directories-first'
	alias         llxK='ls --color=auto -lX --group-directories-first --block-size=1K'
	alias         llxM='ls --color=auto -lX --group-directories-first --block-size=1M'
	alias         llxG='ls --color=auto -lX --group-directories-first --block-size=1G'

	alias          lla='ls --color=auto -lah'
	alias         llaB='ls --color=auto -la'
	alias         llaK='ls --color=auto -la --block-size=1K'
	alias         llaM='ls --color=auto -la --block-size=1M'
	alias         llaG='ls --color=auto -la --block-size=1G'

	alias         llas='ls --color=auto -lahS --group-directories-first'
	alias        llasB='ls --color=auto -laS --group-directories-first'
	alias        llasK='ls --color=auto -laS --group-directories-first --block-size=1K'
	alias        llasM='ls --color=auto -laS --group-directories-first --block-size=1M'
	alias        llasG='ls --color=auto -laS --group-directories-first --block-size=1G'

	alias         llat='ls --color=auto -laht --group-directories-first'
	alias        llatB='ls --color=auto -lat --group-directories-first'
	alias        llatK='ls --color=auto -lat --group-directories-first --block-size=1K'
	alias        llatM='ls --color=auto -lat --group-directories-first --block-size=1M'
	alias        llatG='ls --color=auto -lat --group-directories-first --block-size=1G'

	alias        llars='ls --color=auto -lahrS --group-directories-first'
	alias       llarsB='ls --color=auto -larS --group-directories-first'
	alias       llarsK='ls --color=auto -larS --group-directories-first --block-size=1K'
	alias       llarsM='ls --color=auto -larS --group-directories-first --block-size=1M'
	alias       llarsG='ls --color=auto -larS --group-directories-first --block-size=1G'

	alias        llart='ls --color=auto -lahrt --group-directories-first'
	alias       llartB='ls --color=auto -lart --group-directories-first'
	alias       llartK='ls --color=auto -lart --group-directories-first --block-size=1K'
	alias       llartM='ls --color=auto -lart --group-directories-first --block-size=1M'
	alias       llartG='ls --color=auto -lart --group-directories-first --block-size=1G'

	alias         llax='ls --color=auto -lahX --group-directories-first'
	alias        llaxB='ls --color=auto -laX --group-directories-first'
	alias        llaxK='ls --color=auto -laX --group-directories-first --block-size=1K'
	alias        llaxM='ls --color=auto -laX --group-directories-first --block-size=1M'
	alias        llaxG='ls --color=auto -laX --group-directories-first --block-size=1G'

	alias     ll-color='ls --color=always -lh'
	alias    llB-color='ls --color=always -l'
	alias    llK-color='ls --color=always -l --block-size=1K'
	alias    llM-color='ls --color=always -l --block-size=1M'
	alias    llG-color='ls --color=always -l --block-size=1G'

	alias    lls-color='ls --color=always -lhS --group-directories-first'
	alias   llsB-color='ls --color=always -lS --group-directories-first'
	alias   llsK-color='ls --color=always -lS --group-directories-first --block-size=1K'
	alias   llsM-color='ls --color=always -lS --group-directories-first --block-size=1M'
	alias   llsG-color='ls --color=always -lS --group-directories-first --block-size=1G'

	alias    llt-color='ls --color=always -lht --group-directories-first'
	alias   lltB-color='ls --color=always -lt --group-directories-first'
	alias   lltK-color='ls --color=always -lt --group-directories-first --block-size=1K'
	alias   lltM-color='ls --color=always -lt --group-directories-first --block-size=1M'
	alias   lltG-color='ls --color=always -lt --group-directories-first --block-size=1G'

	alias   llrs-color='ls --color=always -lhrS --group-directories-first'
	alias  llrsB-color='ls --color=always -lrS --group-directories-first'
	alias  llrsK-color='ls --color=always -lrS --group-directories-first --block-size=1K'
	alias  llrsM-color='ls --color=always -lrS --group-directories-first --block-size=1M'
	alias  llrsG-color='ls --color=always -lrS --group-directories-first --block-size=1G'

	alias   llrt-color='ls --color=always -lhrt --group-directories-first'
	alias  llrtB-color='ls --color=always -lrt --group-directories-first'
	alias  llrtK-color='ls --color=always -lrt --group-directories-first --block-size=1K'
	alias  llrtM-color='ls --color=always -lrt --group-directories-first --block-size=1M'
	alias  llrtG-color='ls --color=always -lrt --group-directories-first --block-size=1G'

	alias    llx-color='ls --color=always -lhX --group-directories-first'
	alias   llxB-color='ls --color=always -lX --group-directories-first'
	alias   llxK-color='ls --color=always -lX --group-directories-first --block-size=1K'
	alias   llxM-color='ls --color=always -lX --group-directories-first --block-size=1M'
	alias   llxG-color='ls --color=always -lX --group-directories-first --block-size=1G'

	alias    lla-color='ls --color=always -lah'
	alias   llaB-color='ls --color=always -la'
	alias   llaK-color='ls --color=always -la --block-size=1K'
	alias   llaM-color='ls --color=always -la --block-size=1M'
	alias   llaG-color='ls --color=always -la --block-size=1G'

	alias   llas-color='ls --color=always -lahS --group-directories-first'
	alias  llasB-color='ls --color=always -laS --group-directories-first'
	alias  llasK-color='ls --color=always -laS --group-directories-first --block-size=1K'
	alias  llasM-color='ls --color=always -laS --group-directories-first --block-size=1M'
	alias  llasG-color='ls --color=always -laS --group-directories-first --block-size=1G'

	alias   llat-color='ls --color=always -laht --group-directories-first'
	alias  llatB-color='ls --color=always -lat --group-directories-first'
	alias  llatK-color='ls --color=always -lat --group-directories-first --block-size=1K'
	alias  llatM-color='ls --color=always -lat --group-directories-first --block-size=1M'
	alias  llatG-color='ls --color=always -lat --group-directories-first --block-size=1G'

	alias  llars-color='ls --color=always -lahrS --group-directories-first'
	alias llarsB-color='ls --color=always -larS --group-directories-first'
	alias llarsK-color='ls --color=always -larS --group-directories-first --block-size=1K'
	alias llarsM-color='ls --color=always -larS --group-directories-first --block-size=1M'
	alias llarsG-color='ls --color=always -larS --group-directories-first --block-size=1G'

	alias  llart-color='ls --color=always -lahrt --group-directories-first'
	alias llartB-color='ls --color=always -lart --group-directories-first'
	alias llartK-color='ls --color=always -lart --group-directories-first --block-size=1K'
	alias llartM-color='ls --color=always -lart --group-directories-first --block-size=1M'
	alias llartG-color='ls --color=always -lart --group-directories-first --block-size=1G'

	alias   llax-color='ls --color=always -lahX --group-directories-first'
	alias  llaxB-color='ls --color=always -laX --group-directories-first'
	alias  llaxK-color='ls --color=always -laX --group-directories-first --block-size=1K'
	alias  llaxM-color='ls --color=always -laX --group-directories-first --block-size=1M'
	alias  llaxG-color='ls --color=always -laX --group-directories-first --block-size=1G'
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
