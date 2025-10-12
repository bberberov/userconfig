# shellcheck disable=SC2139

# cd
alias     cd.='cd ..'
alias    cd..='cd ../..'
alias   cd...='cd ../../..'
alias  cd....='cd ../../../..'
alias cd.....='cd ../../../../..'

alias  cd-xdg-config='cd "${XDG_CONFIG_HOME:-${HOME}/.config}"'
alias   cd-xdg-cache='cd "${XDG_CACHE_HOME:-${HOME}/.cache}"'
alias    cd-xdg-data='cd "${XDG_DATA_HOME:-${HOME}/.local/share}"'
alias   cd-xdg-state='cd "${XDG_STATE_HOME:-${HOME}/.local/state}"'
alias cd-xdg-runtime='test -d "${XDG_RUNTIME_DIR}" && cd "${XDG_RUNTIME_DIR}"'

# delta
if   which delta > /dev/null 2>&1
then
	alias delta-y='delta --features=diffy'
fi

# df
if   which df > /dev/null 2>&1
then
	if   df --version > /dev/null 2>&1
	then
		# GNU df
		alias        df='df -h'
		alias   df-long='df -h --output=source,fstype,itotal,iused,ipcent,iavail,target,size,used,pcent,avail'
		alias df-blocks='df -h --output=source,target,size,used,pcent,avail'
		alias df-inodes='df -h --output=source,target,itotal,iused,ipcent,iavail'
		alias   df-free='df -h --output=source,target,iavail,avail'
		alias   df-full='df -h --output=source,target,ipcent,pcent'

		alias   df-long-disk='df -h --output=source,fstype,itotal,iused,ipcent,iavail,target,size,used,pcent,avail -x devtmpfs -x tmpfs'
		alias df-blocks-disk='df -h --output=source,target,size,used,pcent,avail -x devtmpfs -x tmpfs'
		alias df-inodes-disk='df -h --output=source,target,itotal,iused,ipcent,iavail -x devtmpfs -x tmpfs'
		alias   df-free-disk='df -h --output=source,target,iavail,avail -x devtmpfs -x tmpfs'
		alias   df-full-disk='df -h --output=source,target,ipcent,pcent -x devtmpfs -x tmpfs'
	else
		# non-GNU df
		alias        df='df -Ph'
		alias   df-long='df -hi'
	fi
fi

# exa
if   which exa > /dev/null 2>&1
then
	alias   exa='exa --group-directories-first'
	alias  lexa='exa --group-directories-first -lbg'
	alias  texa='exa --group-directories-first -T'
	alias exalt='exa --group-directories-first -lbg -T'

	alias   exa-color='exa --color=always --group-directories-first'
	alias  lexa-color='exa --color=always --group-directories-first -lbg'
	alias  texa-color='exa --color=always --group-directories-first -T'
	alias exalt-color='exa --color=always --group-directories-first -lbg -T'

	for (( i=2 ; i < 10 ; i+=1 ))
	do
		alias  "texa${i}"="exa --group-directories-first -T -L ${i}"
		alias "exalt${i}"="exa --group-directories-first -lbg -T -L ${i}"

		alias  "texa${i}-color"="exa --color=always --group-directories-first -T -L ${i}"
		alias "exalt${i}-color"="exa --color=always --group-directories-first -lbg -T -L ${i}"
	done
fi

# eza
if   which eza > /dev/null 2>&1
then
	alias   eza='eza --group-directories-first'
	alias  leza='eza --group-directories-first -lbg'
	alias  teza='eza --group-directories-first -T'
	alias ezalt='eza --group-directories-first -lbg -T'

	alias   eza-color='eza --color=always --group-directories-first'
	alias  leza-color='eza --color=always --group-directories-first -lbg'
	alias  teza-color='eza --color=always --group-directories-first -T'
	alias ezalt-color='eza --color=always --group-directories-first -lbg -T'

	for (( i=2 ; i < 10 ; i+=1 ))
	do
		alias  "teza${i}"="eza --group-directories-first -T -L ${i}"
		alias "ezalt${i}"="eza --group-directories-first -lbg -T -L ${i}"

		alias  "teza${i}-color"="eza --color=always --group-directories-first -T -L ${i}"
		alias "ezalt${i}-color"="eza --color=always --group-directories-first -lbg -T -L ${i}"
	done
fi

# fd
if   which fd > /dev/null 2>&1
then
	alias fd-color='fd --color=always'
fi

# findmnt
if   which findmnt > /dev/null 2>&1
then
	alias         lsmount='findmnt -o SOURCE,TARGET,FSTYPE,OPTIONS'
	alias     lsmount-opt='findmnt -o SOURCE,TARGET,VFS-OPTIONS,FS-OPTIONS'
	alias     lsmount-vfs='findmnt --vfs-all -o SOURCE,TARGET,VFS-OPTIONS'
	alias    lsmount-tree='findmnt -o SOURCE,FSTYPE,TARGET'
	alias         lsfstab='findmnt --fstab -o SOURCE,TARGET,FSTYPE,OPTIONS,FREQ,PASSNO'
	alias     lsfstab-opt='findmnt --fstab -o SOURCE,TARGET,FSTYPE,VFS-OPTIONS,FS-OPTIONS,FREQ,PASSNO'
	alias     lsfstab-dev='findmnt --fstab -e -o SOURCE,TARGET,FSTYPE,OPTIONS,FREQ,PASSNO'
	alias lsfstab-dev-opt='findmnt --fstab -e -o SOURCE,TARGET,FSTYPE,VFS-OPTIONS,FS-OPTIONS,FREQ,PASSNO'
fi

# git
if   which git > /dev/null 2>&1
then
	alias cd-git-repo='declare r="$(git rev-parse --git-common-dir 2> /dev/null)"; [[ -n "${r}" ]] && cd "${r}/"'
	alias cd-git-tree='
		if   [[ -f "gitdir" ]]
		then
			cd-file-gitdir
		else
			declare t="$(git rev-parse --show-toplevel 2> /dev/null)"
			if   [[ -n "${t}" ]]
			then
				cd "${t}"
			else
				echo "fatal: this operation must be run in a worktree or a worktree configuration directory"
				false
			fi
		fi
	'

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

#
# KDE
#
if   which kstart > /dev/null 2>&1
then
	if   which dolphin > /dev/null 2>&1
	then
		alias dolphin-here='kstart -- dolphin "$(pwd)"'
	fi

	if   which konsole > /dev/null 2>&1
	then
		alias konsole-here='kstart -- konsole --workdir "$(pwd)"'
	fi
fi

# less
if   which less > /dev/null 2>&1
then
	#
	# NOTE: Probably not going to look for exceptions before version 340
	# NOTE: ( the introduction of the -F and -R options, and UTF-8 support)
	# NOTE: `--version` was added earlier
	#
	if   which sed > /dev/null 2>&1
	then
		less_version="$(less --version | sed -nE -e '1{ s/^less ([0-9]+).*/\1/; p; }')"
	elif which grep > /dev/null 2>&1
	then
		less_version="$(less --version | grep -Eo '^less [0-9]+' | grep -Eo '[0-9]+')"
	else
		less_version='340'
	fi

	if   (( 620 < less_version ))
	then
		# --wordwrap was introduced in 621
		alias less-wrap='less --wordwrap'
	fi

	unset less_version
fi

# ls
if   which ls > /dev/null 2>&1
then
	if   ls --version > /dev/null 2>&1
	then
		# GNU ls

		# ls base
		alias            ls='ls --color=auto'
		alias           lsg='ls --color=auto    --group-directories-first'
		alias           lsx='ls --color=auto -X --group-directories-first'

		alias      ls-color='ls --color=always'
		alias     lsg-color='ls --color=always    --group-directories-first'
		alias     lsx-color='ls --color=always -X --group-directories-first'

		# la base
		alias            la='ls --color=auto -A'
		alias           lag='ls --color=auto -A  --group-directories-first'
		alias           lax='ls --color=auto -AX --group-directories-first'

		alias      la-color='ls --color=always -A'
		alias     lag-color='ls --color=always -A  --group-directories-first'
		alias     lax-color='ls --color=always -AX --group-directories-first'

		# l1 base
		alias            l1='ls --color=auto -1'
		alias           l1g='ls --color=auto -1  --group-directories-first'
		alias           l1x='ls --color=auto -1X --group-directories-first'

		alias           l1a='ls --color=auto -1A'
		alias          l1ag='ls --color=auto -1A  --group-directories-first'
		alias          l1ax='ls --color=auto -1AX --group-directories-first'

		alias      l1-color='ls --color=always -1'
		alias     l1g-color='ls --color=always -1  --group-directories-first'
		alias     l1x-color='ls --color=always -1X --group-directories-first'

		alias     l1a-color='ls --color=always -1A'
		alias    l1ag-color='ls --color=always -1A  --group-directories-first'
		alias    l1ax-color='ls --color=always -1AX --group-directories-first'

		# ll base
		alias            ll='ls --color=auto -l --human-readable'
		alias           llB='ls --color=auto -l'
		alias           llK='ls --color=auto -l --block-size=1K'
		alias           llM='ls --color=auto -l --block-size=1M'
		alias           llG='ls --color=auto -l --block-size=1G'

		alias           lls='ls --color=auto -lS --human-readable'
		alias          llsB='ls --color=auto -lS'
		alias          llsK='ls --color=auto -lS --block-size=1K'
		alias          llsM='ls --color=auto -lS --block-size=1M'
		alias          llsG='ls --color=auto -lS --block-size=1G'

		alias           llt='ls --color=auto -lt --human-readable'
		alias          lltB='ls --color=auto -lt'
		alias          lltK='ls --color=auto -lt --block-size=1K'
		alias          lltM='ls --color=auto -lt --block-size=1M'
		alias          lltG='ls --color=auto -lt --block-size=1G'

		alias          llrs='ls --color=auto -lrS --human-readable'
		alias         llrsB='ls --color=auto -lrS'
		alias         llrsK='ls --color=auto -lrS --block-size=1K'
		alias         llrsM='ls --color=auto -lrS --block-size=1M'
		alias         llrsG='ls --color=auto -lrS --block-size=1G'

		alias          llrt='ls --color=auto -lrt --human-readable'
		alias         llrtB='ls --color=auto -lrt'
		alias         llrtK='ls --color=auto -lrt --block-size=1K'
		alias         llrtM='ls --color=auto -lrt --block-size=1M'
		alias         llrtG='ls --color=auto -lrt --block-size=1G'

		alias           llg='ls --color=auto -l --group-directories-first --human-readable'
		alias          llgB='ls --color=auto -l --group-directories-first'
		alias          llgK='ls --color=auto -l --group-directories-first --block-size=1K'
		alias          llgM='ls --color=auto -l --group-directories-first --block-size=1M'
		alias          llgG='ls --color=auto -l --group-directories-first --block-size=1G'

		alias          llgs='ls --color=auto -lS --group-directories-first --human-readable'
		alias         llgsB='ls --color=auto -lS --group-directories-first'
		alias         llgsK='ls --color=auto -lS --group-directories-first --block-size=1K'
		alias         llgsM='ls --color=auto -lS --group-directories-first --block-size=1M'
		alias         llgsG='ls --color=auto -lS --group-directories-first --block-size=1G'

		alias          llgt='ls --color=auto -lt --group-directories-first --human-readable'
		alias         llgtB='ls --color=auto -lt --group-directories-first'
		alias         llgtK='ls --color=auto -lt --group-directories-first --block-size=1K'
		alias         llgtM='ls --color=auto -lt --group-directories-first --block-size=1M'
		alias         llgtG='ls --color=auto -lt --group-directories-first --block-size=1G'

		alias         llgrs='ls --color=auto -lrS --group-directories-first --human-readable'
		alias        llgrsB='ls --color=auto -lrS --group-directories-first'
		alias        llgrsK='ls --color=auto -lrS --group-directories-first --block-size=1K'
		alias        llgrsM='ls --color=auto -lrS --group-directories-first --block-size=1M'
		alias        llgrsG='ls --color=auto -lrS --group-directories-first --block-size=1G'

		alias         llgrt='ls --color=auto -lrt --group-directories-first --human-readable'
		alias        llgrtB='ls --color=auto -lrt --group-directories-first'
		alias        llgrtK='ls --color=auto -lrt --group-directories-first --block-size=1K'
		alias        llgrtM='ls --color=auto -lrt --group-directories-first --block-size=1M'
		alias        llgrtG='ls --color=auto -lrt --group-directories-first --block-size=1G'

		alias           llx='ls --color=auto -lX --group-directories-first --human-readable'
		alias          llxB='ls --color=auto -lX --group-directories-first'
		alias          llxK='ls --color=auto -lX --group-directories-first --block-size=1K'
		alias          llxM='ls --color=auto -lX --group-directories-first --block-size=1M'
		alias          llxG='ls --color=auto -lX --group-directories-first --block-size=1G'

		alias           lla='ls --color=auto -lA --human-readable'
		alias          llaB='ls --color=auto -lA'
		alias          llaK='ls --color=auto -lA --block-size=1K'
		alias          llaM='ls --color=auto -lA --block-size=1M'
		alias          llaG='ls --color=auto -lA --block-size=1G'

		alias          llas='ls --color=auto -lAS --human-readable'
		alias         llasB='ls --color=auto -lAS'
		alias         llasK='ls --color=auto -lAS --block-size=1K'
		alias         llasM='ls --color=auto -lAS --block-size=1M'
		alias         llasG='ls --color=auto -lAS --block-size=1G'

		alias          llat='ls --color=auto -lAt --human-readable'
		alias         llatB='ls --color=auto -lAt'
		alias         llatK='ls --color=auto -lAt --block-size=1K'
		alias         llatM='ls --color=auto -lAt --block-size=1M'
		alias         llatG='ls --color=auto -lAt --block-size=1G'

		alias         llars='ls --color=auto -lArS --human-readable'
		alias        llarsB='ls --color=auto -lArS'
		alias        llarsK='ls --color=auto -lArS --block-size=1K'
		alias        llarsM='ls --color=auto -lArS --block-size=1M'
		alias        llarsG='ls --color=auto -lArS --block-size=1G'

		alias         llart='ls --color=auto -lArt --human-readable'
		alias        llartB='ls --color=auto -lArt'
		alias        llartK='ls --color=auto -lArt --block-size=1K'
		alias        llartM='ls --color=auto -lArt --block-size=1M'
		alias        llartG='ls --color=auto -lArt --block-size=1G'

		alias          llag='ls --color=auto -lA --group-directories-first --human-readable'
		alias         llagB='ls --color=auto -lA --group-directories-first'
		alias         llagK='ls --color=auto -lA --group-directories-first --block-size=1K'
		alias         llagM='ls --color=auto -lA --group-directories-first --block-size=1M'
		alias         llagG='ls --color=auto -lA --group-directories-first --block-size=1G'

		alias         llags='ls --color=auto -lAS --group-directories-first --human-readable'
		alias        llagsB='ls --color=auto -lAS --group-directories-first'
		alias        llagsK='ls --color=auto -lAS --group-directories-first --block-size=1K'
		alias        llagsM='ls --color=auto -lAS --group-directories-first --block-size=1M'
		alias        llagsG='ls --color=auto -lAS --group-directories-first --block-size=1G'

		alias         llagt='ls --color=auto -lAt --group-directories-first --human-readable'
		alias        llagtB='ls --color=auto -lAt --group-directories-first'
		alias        llagtK='ls --color=auto -lAt --group-directories-first --block-size=1K'
		alias        llagtM='ls --color=auto -lAt --group-directories-first --block-size=1M'
		alias        llagtG='ls --color=auto -lAt --group-directories-first --block-size=1G'

		alias        llagrs='ls --color=auto -lArS --group-directories-first --human-readable'
		alias       llagrsB='ls --color=auto -lArS --group-directories-first'
		alias       llagrsK='ls --color=auto -lArS --group-directories-first --block-size=1K'
		alias       llagrsM='ls --color=auto -lArS --group-directories-first --block-size=1M'
		alias       llagrsG='ls --color=auto -lArS --group-directories-first --block-size=1G'

		alias        llagrt='ls --color=auto -lArt --group-directories-first --human-readable'
		alias       llagrtB='ls --color=auto -lArt --group-directories-first'
		alias       llagrtK='ls --color=auto -lArt --group-directories-first --block-size=1K'
		alias       llagrtM='ls --color=auto -lArt --group-directories-first --block-size=1M'
		alias       llagrtG='ls --color=auto -lArt --group-directories-first --block-size=1G'

		alias          llax='ls --color=auto -lAX --group-directories-first --human-readable'
		alias         llaxB='ls --color=auto -lAX --group-directories-first'
		alias         llaxK='ls --color=auto -lAX --group-directories-first --block-size=1K'
		alias         llaxM='ls --color=auto -lAX --group-directories-first --block-size=1M'
		alias         llaxG='ls --color=auto -lAX --group-directories-first --block-size=1G'

		alias      ll-color='ls --color=always -l --human-readable'
		alias     llB-color='ls --color=always -l'
		alias     llK-color='ls --color=always -l --block-size=1K'
		alias     llM-color='ls --color=always -l --block-size=1M'
		alias     llG-color='ls --color=always -l --block-size=1G'

		alias     lls-color='ls --color=always -lS --human-readable'
		alias    llsB-color='ls --color=always -lS'
		alias    llsK-color='ls --color=always -lS --block-size=1K'
		alias    llsM-color='ls --color=always -lS --block-size=1M'
		alias    llsG-color='ls --color=always -lS --block-size=1G'

		alias     llt-color='ls --color=always -lt --human-readable'
		alias    lltB-color='ls --color=always -lt'
		alias    lltK-color='ls --color=always -lt --block-size=1K'
		alias    lltM-color='ls --color=always -lt --block-size=1M'
		alias    lltG-color='ls --color=always -lt --block-size=1G'

		alias    llrs-color='ls --color=always -lrS --human-readable'
		alias   llrsB-color='ls --color=always -lrS'
		alias   llrsK-color='ls --color=always -lrS --block-size=1K'
		alias   llrsM-color='ls --color=always -lrS --block-size=1M'
		alias   llrsG-color='ls --color=always -lrS --block-size=1G'

		alias    llrt-color='ls --color=always -lrt --human-readable'
		alias   llrtB-color='ls --color=always -lrt'
		alias   llrtK-color='ls --color=always -lrt --block-size=1K'
		alias   llrtM-color='ls --color=always -lrt --block-size=1M'
		alias   llrtG-color='ls --color=always -lrt --block-size=1G'

		alias     llg-color='ls --color=always -l --group-directories-first --human-readable'
		alias    llgB-color='ls --color=always -l --group-directories-first'
		alias    llgK-color='ls --color=always -l --group-directories-first --block-size=1K'
		alias    llgM-color='ls --color=always -l --group-directories-first --block-size=1M'
		alias    llgG-color='ls --color=always -l --group-directories-first --block-size=1G'

		alias    llgs-color='ls --color=always -lS --group-directories-first --human-readable'
		alias   llgsB-color='ls --color=always -lS --group-directories-first'
		alias   llgsK-color='ls --color=always -lS --group-directories-first --block-size=1K'
		alias   llgsM-color='ls --color=always -lS --group-directories-first --block-size=1M'
		alias   llgsG-color='ls --color=always -lS --group-directories-first --block-size=1G'

		alias    llgt-color='ls --color=always -lt --group-directories-first --human-readable'
		alias   llgtB-color='ls --color=always -lt --group-directories-first'
		alias   llgtK-color='ls --color=always -lt --group-directories-first --block-size=1K'
		alias   llgtM-color='ls --color=always -lt --group-directories-first --block-size=1M'
		alias   llgtG-color='ls --color=always -lt --group-directories-first --block-size=1G'

		alias   llgrs-color='ls --color=always -lrS --group-directories-first --human-readable'
		alias  llgrsB-color='ls --color=always -lrS --group-directories-first'
		alias  llgrsK-color='ls --color=always -lrS --group-directories-first --block-size=1K'
		alias  llgrsM-color='ls --color=always -lrS --group-directories-first --block-size=1M'
		alias  llgrsG-color='ls --color=always -lrS --group-directories-first --block-size=1G'

		alias   llgrt-color='ls --color=always -lrt --group-directories-first --human-readable'
		alias  llgrtB-color='ls --color=always -lrt --group-directories-first'
		alias  llgrtK-color='ls --color=always -lrt --group-directories-first --block-size=1K'
		alias  llgrtM-color='ls --color=always -lrt --group-directories-first --block-size=1M'
		alias  llgrtG-color='ls --color=always -lrt --group-directories-first --block-size=1G'

		alias     llx-color='ls --color=always -lX --group-directories-first --human-readable'
		alias    llxB-color='ls --color=always -lX --group-directories-first'
		alias    llxK-color='ls --color=always -lX --group-directories-first --block-size=1K'
		alias    llxM-color='ls --color=always -lX --group-directories-first --block-size=1M'
		alias    llxG-color='ls --color=always -lX --group-directories-first --block-size=1G'

		alias     lla-color='ls --color=always -lA --human-readable'
		alias    llaB-color='ls --color=always -lA'
		alias    llaK-color='ls --color=always -lA --block-size=1K'
		alias    llaM-color='ls --color=always -lA --block-size=1M'
		alias    llaG-color='ls --color=always -lA --block-size=1G'

		alias    llas-color='ls --color=always -lAS --human-readable'
		alias   llasB-color='ls --color=always -lAS'
		alias   llasK-color='ls --color=always -lAS --block-size=1K'
		alias   llasM-color='ls --color=always -lAS --block-size=1M'
		alias   llasG-color='ls --color=always -lAS --block-size=1G'

		alias    llat-color='ls --color=always -lAt --human-readable'
		alias   llatB-color='ls --color=always -lAt'
		alias   llatK-color='ls --color=always -lAt --block-size=1K'
		alias   llatM-color='ls --color=always -lAt --block-size=1M'
		alias   llatG-color='ls --color=always -lAt --block-size=1G'

		alias   llars-color='ls --color=always -lArS --human-readable'
		alias  llarsB-color='ls --color=always -lArS'
		alias  llarsK-color='ls --color=always -lArS --block-size=1K'
		alias  llarsM-color='ls --color=always -lArS --block-size=1M'
		alias  llarsG-color='ls --color=always -lArS --block-size=1G'

		alias   llart-color='ls --color=always -lArt --human-readable'
		alias  llartB-color='ls --color=always -lArt'
		alias  llartK-color='ls --color=always -lArt --block-size=1K'
		alias  llartM-color='ls --color=always -lArt --block-size=1M'
		alias  llartG-color='ls --color=always -lArt --block-size=1G'

		alias    llag-color='ls --color=always -lA --group-directories-first --human-readable'
		alias   llagB-color='ls --color=always -lA --group-directories-first'
		alias   llagK-color='ls --color=always -lA --group-directories-first --block-size=1K'
		alias   llagM-color='ls --color=always -lA --group-directories-first --block-size=1M'
		alias   llagG-color='ls --color=always -lA --group-directories-first --block-size=1G'

		alias   llags-color='ls --color=always -lAS --group-directories-first --human-readable'
		alias  llagsB-color='ls --color=always -lAS --group-directories-first'
		alias  llagsK-color='ls --color=always -lAS --group-directories-first --block-size=1K'
		alias  llagsM-color='ls --color=always -lAS --group-directories-first --block-size=1M'
		alias  llagsG-color='ls --color=always -lAS --group-directories-first --block-size=1G'

		alias   llagt-color='ls --color=always -lAt --group-directories-first --human-readable'
		alias  llagtB-color='ls --color=always -lAt --group-directories-first'
		alias  llagtK-color='ls --color=always -lAt --group-directories-first --block-size=1K'
		alias  llagtM-color='ls --color=always -lAt --group-directories-first --block-size=1M'
		alias  llagtG-color='ls --color=always -lAt --group-directories-first --block-size=1G'

		alias  llagrs-color='ls --color=always -lArS --group-directories-first --human-readable'
		alias llagrsB-color='ls --color=always -lArS --group-directories-first'
		alias llagrsK-color='ls --color=always -lArS --group-directories-first --block-size=1K'
		alias llagrsM-color='ls --color=always -lArS --group-directories-first --block-size=1M'
		alias llagrsG-color='ls --color=always -lArS --group-directories-first --block-size=1G'

		alias  llagrt-color='ls --color=always -lArt --group-directories-first --human-readable'
		alias llagrtB-color='ls --color=always -lArt --group-directories-first'
		alias llagrtK-color='ls --color=always -lArt --group-directories-first --block-size=1K'
		alias llagrtM-color='ls --color=always -lArt --group-directories-first --block-size=1M'
		alias llagrtG-color='ls --color=always -lArt --group-directories-first --block-size=1G'

		alias    llax-color='ls --color=always -lAX --group-directories-first --human-readable'
		alias   llaxB-color='ls --color=always -lAX --group-directories-first'
		alias   llaxK-color='ls --color=always -lAX --group-directories-first --block-size=1K'
		alias   llaxM-color='ls --color=always -lAX --group-directories-first --block-size=1M'
		alias   llaxG-color='ls --color=always -lAX --group-directories-first --block-size=1G'
	else
		# non-GNU ls

		# ls base
		alias           ls='ls -G'
		alias     ls-color='CLICOLOR_FORCE=1 ls -G'

		# la base
		alias           la='ls -G -A'
		alias     la-color='CLICOLOR_FORCE=1 ls -A'

		# l1 base
		alias           l1='ls -G -1'
		alias          l1a='ls -G -1A'

		alias     l1-color='CLICOLOR_FORCE=1 ls -1'
		alias    l1a-color='CLICOLOR_FORCE=1 ls -1A'

		# ll base
		alias           ll='ls -G -lh'
		alias          llB='ls -G -l'
		alias          llK='BLOCKSIZE=1024 ls -G -l '
		alias          llM='BLOCKSIZE=1048576 ls -G -l '
		alias          llG='BLOCKSIZE=1073741824 ls -G -l '

		alias          lls='ls -G -lhS'
		alias         llsB='ls -G -lS'
		alias         llsK='BLOCKSIZE=1024 ls -G -lS '
		alias         llsM='BLOCKSIZE=1048576 ls -G -lS '
		alias         llsG='BLOCKSIZE=1073741824 ls -G -lS '

		alias          llt='ls -G -lht'
		alias         lltB='ls -G -lt'
		alias         lltK='BLOCKSIZE=1024 ls -G -lt '
		alias         lltM='BLOCKSIZE=1048576 ls -G -lt '
		alias         lltG='BLOCKSIZE=1073741824 ls -G -lt '

		alias         llrs='ls -G -lhrS'
		alias        llrsB='ls -G -lrS'
		alias        llrsK='BLOCKSIZE=1024 ls -G -lrS '
		alias        llrsM='BLOCKSIZE=1048576 ls -G -lrS '
		alias        llrsG='BLOCKSIZE=1073741824 ls -G -lrS '

		alias         llrt='ls -G -lhrt'
		alias        llrtB='ls -G -lrt'
		alias        llrtK='BLOCKSIZE=1024 ls -G -lrt '
		alias        llrtM='BLOCKSIZE=1048576 ls -G -lrt '
		alias        llrtG='BLOCKSIZE=1073741824 ls -G -lrt '

		alias          lla='ls -G -lAh'
		alias         llaB='ls -G -lA'
		alias         llaK='BLOCKSIZE=1024 ls -G -lA '
		alias         llaM='BLOCKSIZE=1048576 ls -G -lA '
		alias         llaG='BLOCKSIZE=1073741824 ls -G -lA '

		alias         llas='ls -G -lAhS'
		alias        llasB='ls -G -lAS'
		alias        llasK='BLOCKSIZE=1024 ls -G -lAS '
		alias        llasM='BLOCKSIZE=1048576 ls -G -lAS '
		alias        llasG='BLOCKSIZE=1073741824 ls -G -lAS '

		alias         llat='ls -G -lAht'
		alias        llatB='ls -G -lAt'
		alias        llatK='BLOCKSIZE=1024 ls -G -lAt '
		alias        llatM='BLOCKSIZE=1048576 ls -G -lAt '
		alias        llatG='BLOCKSIZE=1073741824 ls -G -lAt '

		alias        llars='ls -G -lAhrS'
		alias       llarsB='ls -G -lArS'
		alias       llarsK='BLOCKSIZE=1024 ls -G -lArS '
		alias       llarsM='BLOCKSIZE=1048576 ls -G -lArS '
		alias       llarsG='BLOCKSIZE=1073741824 ls -G -lArS '

		alias        llart='ls -G -lAhrt'
		alias       llartB='ls -G -lArt'
		alias       llartK='BLOCKSIZE=1024 ls -G -lArt '
		alias       llartM='BLOCKSIZE=1048576 ls -G -lArt '
		alias       llartG='BLOCKSIZE=1073741824 ls -G -lArt '

		alias     ll-color='CLICOLOR_FORCE=1 ls -lh'
		alias    llB-color='CLICOLOR_FORCE=1 ls -l'
		alias    llK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -l'
		alias    llM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -l'
		alias    llG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -l'

		alias    lls-color='CLICOLOR_FORCE=1 ls -lhS'
		alias   llsB-color='CLICOLOR_FORCE=1 ls -lS'
		alias   llsK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lS'
		alias   llsM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lS'
		alias   llsG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lS'

		alias    llt-color='CLICOLOR_FORCE=1 ls -lht'
		alias   lltB-color='CLICOLOR_FORCE=1 ls -lt'
		alias   lltK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lt'
		alias   lltM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lt'
		alias   lltG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lt'

		alias   llrs-color='CLICOLOR_FORCE=1 ls -lhrS'
		alias  llrsB-color='CLICOLOR_FORCE=1 ls -lrS'
		alias  llrsK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lrS'
		alias  llrsM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lrS'
		alias  llrsG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lrS'

		alias   llrt-color='CLICOLOR_FORCE=1 ls -lhrt'
		alias  llrtB-color='CLICOLOR_FORCE=1 ls -lrt'
		alias  llrtK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lrt'
		alias  llrtM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lrt'
		alias  llrtG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lrt'

		alias    lla-color='CLICOLOR_FORCE=1 ls -lAh'
		alias   llaB-color='CLICOLOR_FORCE=1 ls -lA'
		alias   llaK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lA'
		alias   llaM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lA'
		alias   llaG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lA'

		alias   llas-color='CLICOLOR_FORCE=1 ls -lAhS'
		alias  llasB-color='CLICOLOR_FORCE=1 ls -lAS'
		alias  llasK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lAS'
		alias  llasM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lAS'
		alias  llasG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lAS'

		alias   llat-color='CLICOLOR_FORCE=1 ls -lAht'
		alias  llatB-color='CLICOLOR_FORCE=1 ls -lAt'
		alias  llatK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lAt'
		alias  llatM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lAt'
		alias  llatG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lAt'

		alias  llars-color='CLICOLOR_FORCE=1 ls -lAhrS'
		alias llarsB-color='CLICOLOR_FORCE=1 ls -lArS'
		alias llarsK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lArS'
		alias llarsM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lArS'
		alias llarsG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lArS'

		alias  llart-color='CLICOLOR_FORCE=1 ls -lAhrt'
		alias llartB-color='CLICOLOR_FORCE=1 ls -lArt'
		alias llartK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lArt'
		alias llartM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lArt'
		alias llartG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lArt'
	fi
fi

# lsblk
if   which lsblk > /dev/null 2>&1
then
	alias lsblk-disk='lsblk -dp -o NAME,GROUP,TRAN,VENDOR,MODEL,REV,SERIAL,SIZE,PHY-SEC,LOG-SEC,ZONED,SCHED'
	alias lsblk-part='lsblk  -p -o NAME,PTTYPE,TYPE,SIZE,PARTTYPE,PARTTYPENAME,PARTFLAGS,PARTLABEL,MOUNTPOINTS'
	alias   lsblk-fs='lsblk  -p -o NAME,TYPE,FSTYPE,SIZE,FSSIZE,FSUSED,FSAVAIL,FSUSE%,LABEL,PARTLABEL,MOUNTPOINTS'
fi

# npm
if   which npm > /dev/null 2>&1
then
	alias     npm-list='npm list --global'
	alias npm-outdated='npm outdated --global'
	alias   npm-update='npm update --global'
fi

# pip
if   which pip > /dev/null 2>&1
then
	alias     pip-list='pip list --user'
	alias pip-outdated='pip list --user --outdated'
fi

# pip2
if   which pip2 > /dev/null 2>&1
then
	alias     pip2-list='pip2 list --user'
	alias pip2-outdated='pip2 list --user --outdated'
fi

# pip3
if   which pip3 > /dev/null 2>&1
then
	alias     pip3-list='pip3 list --user'
	alias pip3-outdated='pip3 list --user --outdated'
fi

# rg
if   which rg > /dev/null 2>&1
then
	alias rg-color='rg --color=always'

	for (( i=1 ; i < 10 ; i+=1 ))
	do
		alias "rg${i}"="rg --context=${i}"
		alias "rg${i}a"="rg --after-context=${i}"
		alias "rg${i}b"="rg --before-context=${i}"
		alias "rg${i}-color"="rg --color=always --context=${i}"
		alias "rg${i}a-color"="rg --color=always --after-context=${i}"
		alias "rg${i}b-color"="rg --color=always --before-context=${i}"
	done
fi

# rpm
if   which rpm > /dev/null 2>&1
then
	alias rpm-show='rpm --eval="\
%%{build_cflags}    = %{?build_cflags}
%%{build_cppflags}  = %{?build_cppflags}
%%{build_cxxflags}  = %{?build_cxxflags}
%%{build_fflags}    = %{?build_fflags}
%%{build_fcflags}   = %{?build_fcflags}
%%{build_ldflags}   = %{?build_ldflags}
%%{build_rustflags} = %{?build_rustflags}

%%make_build        = %{?make_build}
%%make_install      = %{?make_install}
"'
fi

# sed
if   which sed > /dev/null 2>&1
then
	alias Esed='sed -E'

	alias cd-file-gitdir='cd "$(sed -e s:\/\.git\$:: gitdir)"'
	alias cd-file-.git='cd "$(sed -e s@^gitdir:\ \/@/@ .git)"'

	# Custom
	alias list-path='echo $PATH | sed -e "s/:/\n/g"'
fi

# stat
if   which stat > /dev/null 2>&1
then
	alias stat-human='stat --printf="\
  File: %n
  Type: %F
  Size: %s bytes, %b*%B bytes allocated  Block size: %o
  Mode: %A %04a  Links: %h
Owners: %U:%G  (%u:%g)
 Birth: %w  (%W)
Change: %z  (%Z)
Modify: %y  (%Y)
Access: %x  (%X)
"'
	alias stat-color='stat --printf="\
\e[90m  File:\e[0m \e[4m%n\e[0m
\e[90m  Type:\e[0m \e[96m%F\e[0m
\e[90m  Size:\e[0m %s\e[0m \e[90mbytes,\e[0m \e[95m%bx%B\e[0m \e[90mbytes allocated\e[0m  \e[90mBlock size:\e[0m \e[95m%o\e[0m
\e[90m  Mode:\e[0m \e[1;94m%A %04a\e[0m  \e[90mLinks:\e[0m %h
\e[90mOwners:\e[0m \e[1;92m%U\e[0;90m:\e[92m%G\e[0m  \e[90m(\e[1;92m%u\e[0;90m:\e[92m%g\e[90m)\e[0m
\e[90m Birth:\e[0m \e[91m%w\e[0m  \e[90m(\e[91m%W\e[90m)\e[0m
\e[90mChange:\e[0m \e[93m%z\e[0m  \e[90m(\e[93m%Z\e[90m)\e[0m
\e[90mModify:\e[0m \e[93m%y\e[0m  \e[90m(\e[93m%Y\e[90m)\e[0m
\e[90mAccess:\e[0m \e[97m%x\e[0m  \e[90m(\e[97m%X\e[90m)\e[0m
"'
fi

# tree
if   which tree > /dev/null 2>&1
then
	alias ltree='tree -pugshD'

	alias  tree-color='tree -C'
	alias ltree-color='tree -CpugshD'

	for (( i=2 ; i < 10 ; i+=1 ))
	do
		alias  "tree${i}"="tree -L ${i}"
		alias "ltree${i}"="tree -L ${i} -pugshD"

		alias  "tree${i}-color"="tree -L ${i} -C"
		alias "ltree${i}-color"="tree -L ${i} -CpugshD"
	done
fi

# tune2fs
if   which tune2fs > /dev/null 2>&1
then
	#                           mount_opts limit: [------8-------+-------+-------|-------+-------+-------+------]
	alias     tune2fs-root='tune2fs -E mount_opts=noatime,errors=remount-ro'
	alias     tune2fs-boot='tune2fs -E mount_opts=noatime,errors=remount-ro,nodev,nosuid,noexec'
	alias      tune2fs-opt='tune2fs -E mount_opts=noatime,errors=remount-ro,nodev,nosuid,commit=20'
	alias      tune2fs-usr='tune2fs -E mount_opts=noatime,errors=remount-ro,nodev,commit=20'
	alias      tune2fs-var='tune2fs -E mount_opts=noatime,errors=remount-ro,nodev,nosuid,commit=20'
	alias   tune2fs-varlib='tune2fs -E mount_opts=noatime,errors=remount-ro,nodev,nosuid,commit=20'
	alias   tune2fs-vartmp='tune2fs -E mount_opts=noatime,errors=remount-ro,nodev,nosuid,commit=20'
	alias     tune2fs-home='tune2fs -E mount_opts=noatime,errors=remount-ro,nodev,nosuid,commit=20'
	alias      tune2fs-srv='tune2fs -E mount_opts=noatime,errors=remount-ro,nodev,nosuid,noexec,commit=20'

	#                               mount_opts limit: [------8-------+-------+-------|-------+-------+-------+------]
	alias      tune2fs-storage='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec,commit=60'
	alias  tune2fs-cold-hdd-1M='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec,nobarrier,commit=60'
	alias tune2fs-cold-hdd-32M='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec,nobarrier,commit=60'
	alias  tune2fs-cold-ssd-1M='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec,nobarrier,commit=60'
	alias tune2fs-cold-ssd-32M='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec,nobarrier,commit=60'
fi

# xdg-user-dir
if   which xdg-user-dir > /dev/null 2>&1
then
	alias     cd-xdg-desktop='cd "$(xdg-user-dir DESKTOP)"'
	alias   cd-xdg-documents='cd "$(xdg-user-dir DOCUMENTS)"'
	alias    cd-xdg-download='cd "$(xdg-user-dir DOWNLOAD)"'
	alias       cd-xdg-music='cd "$(xdg-user-dir MUSIC)"'
	alias    cd-xdg-pictures='cd "$(xdg-user-dir PICTURES)"'
	alias cd-xdg-publicshare='cd "$(xdg-user-dir PUBLICSHARE)"'
	alias   cd-xdg-templates='cd "$(xdg-user-dir TEMPLATES)"'
	alias      cd-xdg-videos='cd "$(xdg-user-dir VIDEOS)"'
fi

# Custom
alias separator='echo; for (( i=0 ; i < ${COLUMNS} ; i+=1 )); do echo -n "="; done; echo; echo'

[ -x /c/Windows/System32/OpenSSH/ssh ]  && alias  ssh-win='/c/Windows/System32/OpenSSH/ssh  -o GSSAPIAuthentication=yes'
[ -x /c/Windows/System32/OpenSSH/scp ]  && alias  scp-win='/c/Windows/System32/OpenSSH/scp  -o GSSAPIAuthentication=yes'
[ -x /c/Windows/System32/OpenSSH/sftp ] && alias sftp-win='/c/Windows/System32/OpenSSH/sftp -o GSSAPIAuthentication=yes'
[ -x /c/Windows/System32/OpenSSH/ssh-add ]     && alias     ssh-add-win='/c/Windows/System32/OpenSSH/ssh-add'
[ -x /c/Windows/System32/OpenSSH/ssh-keygen ]  && alias  ssh-keygen-win='/c/Windows/System32/OpenSSH/ssh-keygen'
[ -x /c/Windows/System32/OpenSSH/ssh-keyscan ] && alias ssh-keyscan-win='/c/Windows/System32/OpenSSH/ssh-keyscan'
