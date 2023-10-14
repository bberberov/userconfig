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

# git
if   which git > /dev/null 2>&1
then
	alias cd-git-repo-dir='git rev-parse --git-dir > /dev/null && cd `git rev-parse --git-common-dir`'
	alias  cd-git-git-dir='git rev-parse --git-dir > /dev/null && cd `git rev-parse --git-dir`'
	alias cd-git-tree-dir='git rev-parse --git-dir > /dev/null && cd `git rev-parse --show-toplevel`'

	alias      diff-git='git diff --no-index'
	alias diffchart-git='git diff --no-index --stat --stat-name-width=30'
	alias  diffstat-git='git diff --no-index --stat'
	alias   dirstat-git='git diff --no-index --dirstat'
	alias  linestat-git='git diff --no-index --shortstat'
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

	alias cd.git='cd "$(grep -o \/\.\* .git)"'
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

# less
if   which less > /dev/null 2>&1
then
	alias less-wrap='less --wordwrap'
fi

# ls
if   which ls > /dev/null 2>&1
then
	# ls base
	alias           ls='ls --color=auto'
	alias          lsx='ls --color=auto -X --group-directories-first'

	alias     ls-color='ls --color=always'
	alias    lsx-color='ls --color=always -X --group-directories-first'

	# la base
	alias           la='ls --color=auto -A'
	alias          lax='ls --color=auto -AX --group-directories-first'
	alias          laa='ls --color=auto -a'
	alias         laax='ls --color=auto -aX --group-directories-first'

	alias     la-color='ls --color=always -A'
	alias    lax-color='ls --color=always -AX --group-directories-first'
	alias    laa-color='ls --color=always -a'
	alias   laax-color='ls --color=always -aX --group-directories-first'

	# l1 base
	alias           l1='ls --color=auto -1'
	alias          l1x='ls --color=auto -1X --group-directories-first'

	alias          l1a='ls --color=auto -1A'
	alias         l1ax='ls --color=auto -1AX --group-directories-first'

	alias     l1-color='ls --color=always -1'
	alias    l1x-color='ls --color=always -1X --group-directories-first'

	alias    l1a-color='ls --color=always -1A'
	alias   l1ax-color='ls --color=always -1AX --group-directories-first'

	# ll base
	alias           ll='ls --color=auto -lh'
	alias          llB='ls --color=auto -l'
	alias          llK='ls --color=auto -l --block-size=1K'
	alias          llM='ls --color=auto -l --block-size=1M'
	alias          llG='ls --color=auto -l --block-size=1G'

	alias          lls='ls --color=auto -lhS'
	alias         llsB='ls --color=auto -lS'
	alias         llsK='ls --color=auto -lS --block-size=1K'
	alias         llsM='ls --color=auto -lS --block-size=1M'
	alias         llsG='ls --color=auto -lS --block-size=1G'

	alias          llt='ls --color=auto -lht'
	alias         lltB='ls --color=auto -lt'
	alias         lltK='ls --color=auto -lt --block-size=1K'
	alias         lltM='ls --color=auto -lt --block-size=1M'
	alias         lltG='ls --color=auto -lt --block-size=1G'

	alias         llrs='ls --color=auto -lhrS'
	alias        llrsB='ls --color=auto -lrS'
	alias        llrsK='ls --color=auto -lrS --block-size=1K'
	alias        llrsM='ls --color=auto -lrS --block-size=1M'
	alias        llrsG='ls --color=auto -lrS --block-size=1G'

	alias         llrt='ls --color=auto -lhrt'
	alias        llrtB='ls --color=auto -lrt'
	alias        llrtK='ls --color=auto -lrt --block-size=1K'
	alias        llrtM='ls --color=auto -lrt --block-size=1M'
	alias        llrtG='ls --color=auto -lrt --block-size=1G'

	alias          llx='ls --color=auto -lhX --group-directories-first'
	alias         llxB='ls --color=auto -lX --group-directories-first'
	alias         llxK='ls --color=auto -lX --group-directories-first --block-size=1K'
	alias         llxM='ls --color=auto -lX --group-directories-first --block-size=1M'
	alias         llxG='ls --color=auto -lX --group-directories-first --block-size=1G'

	alias          lla='ls --color=auto -lAh'
	alias         llaB='ls --color=auto -lA'
	alias         llaK='ls --color=auto -lA --block-size=1K'
	alias         llaM='ls --color=auto -lA --block-size=1M'
	alias         llaG='ls --color=auto -lA --block-size=1G'

	alias         llaa='ls --color=auto -lah'
	alias        llaaB='ls --color=auto -la'
	alias        llaaK='ls --color=auto -la --block-size=1K'
	alias        llaaM='ls --color=auto -la --block-size=1M'
	alias        llaaG='ls --color=auto -la --block-size=1G'

	alias         llas='ls --color=auto -lAhS'
	alias        llasB='ls --color=auto -lAS'
	alias        llasK='ls --color=auto -lAS --block-size=1K'
	alias        llasM='ls --color=auto -lAS --block-size=1M'
	alias        llasG='ls --color=auto -lAS --block-size=1G'

	alias         llat='ls --color=auto -lAht'
	alias        llatB='ls --color=auto -lAt'
	alias        llatK='ls --color=auto -lAt --block-size=1K'
	alias        llatM='ls --color=auto -lAt --block-size=1M'
	alias        llatG='ls --color=auto -lAt --block-size=1G'

	alias        llars='ls --color=auto -lAhrS'
	alias       llarsB='ls --color=auto -lArS'
	alias       llarsK='ls --color=auto -lArS --block-size=1K'
	alias       llarsM='ls --color=auto -lArS --block-size=1M'
	alias       llarsG='ls --color=auto -lArS --block-size=1G'

	alias        llart='ls --color=auto -lAhrt'
	alias       llartB='ls --color=auto -lArt'
	alias       llartK='ls --color=auto -lArt --block-size=1K'
	alias       llartM='ls --color=auto -lArt --block-size=1M'
	alias       llartG='ls --color=auto -lArt --block-size=1G'

	alias         llax='ls --color=auto -lAhX --group-directories-first'
	alias        llaxB='ls --color=auto -lAX --group-directories-first'
	alias        llaxK='ls --color=auto -lAX --group-directories-first --block-size=1K'
	alias        llaxM='ls --color=auto -lAX --group-directories-first --block-size=1M'
	alias        llaxG='ls --color=auto -lAX --group-directories-first --block-size=1G'

	alias     ll-color='ls --color=always -lh'
	alias    llB-color='ls --color=always -l'
	alias    llK-color='ls --color=always -l --block-size=1K'
	alias    llM-color='ls --color=always -l --block-size=1M'
	alias    llG-color='ls --color=always -l --block-size=1G'

	alias    lls-color='ls --color=always -lhS'
	alias   llsB-color='ls --color=always -lS'
	alias   llsK-color='ls --color=always -lS --block-size=1K'
	alias   llsM-color='ls --color=always -lS --block-size=1M'
	alias   llsG-color='ls --color=always -lS --block-size=1G'

	alias    llt-color='ls --color=always -lht'
	alias   lltB-color='ls --color=always -lt'
	alias   lltK-color='ls --color=always -lt --block-size=1K'
	alias   lltM-color='ls --color=always -lt --block-size=1M'
	alias   lltG-color='ls --color=always -lt --block-size=1G'

	alias   llrs-color='ls --color=always -lhrS'
	alias  llrsB-color='ls --color=always -lrS'
	alias  llrsK-color='ls --color=always -lrS --block-size=1K'
	alias  llrsM-color='ls --color=always -lrS --block-size=1M'
	alias  llrsG-color='ls --color=always -lrS --block-size=1G'

	alias   llrt-color='ls --color=always -lhrt'
	alias  llrtB-color='ls --color=always -lrt'
	alias  llrtK-color='ls --color=always -lrt --block-size=1K'
	alias  llrtM-color='ls --color=always -lrt --block-size=1M'
	alias  llrtG-color='ls --color=always -lrt --block-size=1G'

	alias    llx-color='ls --color=always -lhX --group-directories-first'
	alias   llxB-color='ls --color=always -lX --group-directories-first'
	alias   llxK-color='ls --color=always -lX --group-directories-first --block-size=1K'
	alias   llxM-color='ls --color=always -lX --group-directories-first --block-size=1M'
	alias   llxG-color='ls --color=always -lX --group-directories-first --block-size=1G'

	alias    lla-color='ls --color=always -lAh'
	alias   llaB-color='ls --color=always -lA'
	alias   llaK-color='ls --color=always -lA --block-size=1K'
	alias   llaM-color='ls --color=always -lA --block-size=1M'
	alias   llaG-color='ls --color=always -lA --block-size=1G'

	alias   llaa-color='ls --color=always -lah'
	alias  llaaB-color='ls --color=always -la'
	alias  llaaK-color='ls --color=always -la --block-size=1K'
	alias  llaaM-color='ls --color=always -la --block-size=1M'
	alias  llaaG-color='ls --color=always -la --block-size=1G'

	alias   llas-color='ls --color=always -lAhS'
	alias  llasB-color='ls --color=always -lAS'
	alias  llasK-color='ls --color=always -lAS --block-size=1K'
	alias  llasM-color='ls --color=always -lAS --block-size=1M'
	alias  llasG-color='ls --color=always -lAS --block-size=1G'

	alias   llat-color='ls --color=always -lAht'
	alias  llatB-color='ls --color=always -lAt'
	alias  llatK-color='ls --color=always -lAt --block-size=1K'
	alias  llatM-color='ls --color=always -lAt --block-size=1M'
	alias  llatG-color='ls --color=always -lAt --block-size=1G'

	alias  llars-color='ls --color=always -lAhrS'
	alias llarsB-color='ls --color=always -lArS'
	alias llarsK-color='ls --color=always -lArS --block-size=1K'
	alias llarsM-color='ls --color=always -lArS --block-size=1M'
	alias llarsG-color='ls --color=always -lArS --block-size=1G'

	alias  llart-color='ls --color=always -lAhrt'
	alias llartB-color='ls --color=always -lArt'
	alias llartK-color='ls --color=always -lArt --block-size=1K'
	alias llartM-color='ls --color=always -lArt --block-size=1M'
	alias llartG-color='ls --color=always -lArt --block-size=1G'

	alias   llax-color='ls --color=always -lAhX --group-directories-first'
	alias  llaxB-color='ls --color=always -lAX --group-directories-first'
	alias  llaxK-color='ls --color=always -lAX --group-directories-first --block-size=1K'
	alias  llaxM-color='ls --color=always -lAX --group-directories-first --block-size=1M'
	alias  llaxG-color='ls --color=always -lAX --group-directories-first --block-size=1G'
fi

# sed
if   which sed > /dev/null 2>&1
then
	alias Esed='sed -E'

	alias cd-gitdir='cd "$(sed -e s:\/\.git\$:: gitdir)"'

	# Custom
	alias list-path='echo $PATH | sed -e "s/:/\n/g"'
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
alias separator='echo; for (( i=0 ; i < ${COLUMNS} ; i+=1 )); do echo -n "="; done; echo; echo'
