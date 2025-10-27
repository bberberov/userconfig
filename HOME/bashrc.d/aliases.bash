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
		alias   df-long-color='df-color -h --output=source,fstype,itotal,iused,ipcent,iavail,target,size,used,pcent,avail'
		alias df-blocks-color='df-color -h --output=source,target,size,used,pcent,avail'
		alias df-inodes-color='df-color -h --output=source,target,itotal,iused,ipcent,iavail'
		alias   df-free-color='df-color -h --output=source,target,iavail,avail'
		alias   df-full-color='df-color -h --output=source,target,ipcent,pcent'

		alias   df-long-disk='df -h --output=source,fstype,itotal,iused,ipcent,iavail,target,size,used,pcent,avail             -l -x devtmpfs -x tmpfs'
		alias df-blocks-disk='df -h --output=source,target,size,used,pcent,avail                                               -l -x devtmpfs -x tmpfs'
		alias df-inodes-disk='df -h --output=source,target,itotal,iused,ipcent,iavail                                          -l -x devtmpfs -x tmpfs'
		alias   df-free-disk='df -h --output=source,target,iavail,avail                                                        -l -x devtmpfs -x tmpfs'
		alias   df-full-disk='df -h --output=source,target,ipcent,pcent                                                        -l -x devtmpfs -x tmpfs'
		alias   df-long-disk-color='df-color -h --output=source,fstype,itotal,iused,ipcent,iavail,target,size,used,pcent,avail -l -x devtmpfs -x tmpfs'
		alias df-blocks-disk-color='df-color -h --output=source,target,size,used,pcent,avail                                   -l -x devtmpfs -x tmpfs'
		alias df-inodes-disk-color='df-color -h --output=source,target,itotal,iused,ipcent,iavail                              -l -x devtmpfs -x tmpfs'
		alias   df-free-disk-color='df-color -h --output=source,target,iavail,avail                                            -l -x devtmpfs -x tmpfs'
		alias   df-full-disk-color='df-color -h --output=source,target,ipcent,pcent                                            -l -x devtmpfs -x tmpfs'
	else
		# non-GNU df
		alias        df='df -Ph'
		alias   df-long='df -hi'
		alias        df-color='df-color -Ph'
		alias   df-long-color='df-color -hi'
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
		alias             ls='ls --color=auto'
		alias           ls-g='ls --color=auto    --group-directories-first'
		alias           ls-x='ls --color=auto -X --group-directories-first'

		alias       ls-color='ls --color=always'
		alias     ls-g-color='ls --color=always    --group-directories-first'
		alias     ls-x-color='ls --color=always -X --group-directories-first'

		# la base
		alias             la='ls --color=auto -A'
		alias           la-g='ls --color=auto -A  --group-directories-first'
		alias           la-x='ls --color=auto -AX --group-directories-first'

		alias       la-color='ls --color=always -A'
		alias     la-g-color='ls --color=always -A  --group-directories-first'
		alias     la-x-color='ls --color=always -AX --group-directories-first'

		# l1 base
		alias             l1='ls --color=auto -1'
		alias           l1-g='ls --color=auto -1  --group-directories-first'
		alias           l1-x='ls --color=auto -1X --group-directories-first'

		alias           l1-a='ls --color=auto -1A'
		alias          l1-ag='ls --color=auto -1A  --group-directories-first'
		alias          l1-ax='ls --color=auto -1AX --group-directories-first'

		alias       l1-color='ls --color=always -1'
		alias     l1-g-color='ls --color=always -1  --group-directories-first'
		alias     l1-x-color='ls --color=always -1X --group-directories-first'

		alias     l1-a-color='ls --color=always -1A'
		alias    l1-ag-color='ls --color=always -1A  --group-directories-first'
		alias    l1-ax-color='ls --color=always -1AX --group-directories-first'

		# ll base
		alias             ll='ls --color=auto -l --human-readable'
		alias           ll-B='ls --color=auto -l'
		alias           ll-K='ls --color=auto -l --block-size=1K'
		alias           ll-M='ls --color=auto -l --block-size=1M'
		alias           ll-G='ls --color=auto -l --block-size=1G'

		alias           ll-s='ls --color=auto -lS --human-readable'
		alias          ll-sB='ls --color=auto -lS'
		alias          ll-sK='ls --color=auto -lS --block-size=1K'
		alias          ll-sM='ls --color=auto -lS --block-size=1M'
		alias          ll-sG='ls --color=auto -lS --block-size=1G'

		alias           ll-t='ls --color=auto -lt --human-readable'
		alias          ll-tB='ls --color=auto -lt'
		alias          ll-tK='ls --color=auto -lt --block-size=1K'
		alias          ll-tM='ls --color=auto -lt --block-size=1M'
		alias          ll-tG='ls --color=auto -lt --block-size=1G'

		alias          ll-rs='ls --color=auto -lrS --human-readable'
		alias         ll-rsB='ls --color=auto -lrS'
		alias         ll-rsK='ls --color=auto -lrS --block-size=1K'
		alias         ll-rsM='ls --color=auto -lrS --block-size=1M'
		alias         ll-rsG='ls --color=auto -lrS --block-size=1G'

		alias          ll-rt='ls --color=auto -lrt --human-readable'
		alias         ll-rtB='ls --color=auto -lrt'
		alias         ll-rtK='ls --color=auto -lrt --block-size=1K'
		alias         ll-rtM='ls --color=auto -lrt --block-size=1M'
		alias         ll-rtG='ls --color=auto -lrt --block-size=1G'

		alias           ll-g='ls --color=auto -l --group-directories-first --human-readable'
		alias          ll-gB='ls --color=auto -l --group-directories-first'
		alias          ll-gK='ls --color=auto -l --group-directories-first --block-size=1K'
		alias          ll-gM='ls --color=auto -l --group-directories-first --block-size=1M'
		alias          ll-gG='ls --color=auto -l --group-directories-first --block-size=1G'

		alias          ll-gs='ls --color=auto -lS --group-directories-first --human-readable'
		alias         ll-gsB='ls --color=auto -lS --group-directories-first'
		alias         ll-gsK='ls --color=auto -lS --group-directories-first --block-size=1K'
		alias         ll-gsM='ls --color=auto -lS --group-directories-first --block-size=1M'
		alias         ll-gsG='ls --color=auto -lS --group-directories-first --block-size=1G'

		alias          ll-gt='ls --color=auto -lt --group-directories-first --human-readable'
		alias         ll-gtB='ls --color=auto -lt --group-directories-first'
		alias         ll-gtK='ls --color=auto -lt --group-directories-first --block-size=1K'
		alias         ll-gtM='ls --color=auto -lt --group-directories-first --block-size=1M'
		alias         ll-gtG='ls --color=auto -lt --group-directories-first --block-size=1G'

		alias         ll-grs='ls --color=auto -lrS --group-directories-first --human-readable'
		alias        ll-grsB='ls --color=auto -lrS --group-directories-first'
		alias        ll-grsK='ls --color=auto -lrS --group-directories-first --block-size=1K'
		alias        ll-grsM='ls --color=auto -lrS --group-directories-first --block-size=1M'
		alias        ll-grsG='ls --color=auto -lrS --group-directories-first --block-size=1G'

		alias         ll-grt='ls --color=auto -lrt --group-directories-first --human-readable'
		alias        ll-grtB='ls --color=auto -lrt --group-directories-first'
		alias        ll-grtK='ls --color=auto -lrt --group-directories-first --block-size=1K'
		alias        ll-grtM='ls --color=auto -lrt --group-directories-first --block-size=1M'
		alias        ll-grtG='ls --color=auto -lrt --group-directories-first --block-size=1G'

		alias           ll-x='ls --color=auto -lX --group-directories-first --human-readable'
		alias          ll-xB='ls --color=auto -lX --group-directories-first'
		alias          ll-xK='ls --color=auto -lX --group-directories-first --block-size=1K'
		alias          ll-xM='ls --color=auto -lX --group-directories-first --block-size=1M'
		alias          ll-xG='ls --color=auto -lX --group-directories-first --block-size=1G'

		alias           ll-a='ls --color=auto -lA --human-readable'
		alias          ll-aB='ls --color=auto -lA'
		alias          ll-aK='ls --color=auto -lA --block-size=1K'
		alias          ll-aM='ls --color=auto -lA --block-size=1M'
		alias          ll-aG='ls --color=auto -lA --block-size=1G'

		alias          ll-as='ls --color=auto -lAS --human-readable'
		alias         ll-asB='ls --color=auto -lAS'
		alias         ll-asK='ls --color=auto -lAS --block-size=1K'
		alias         ll-asM='ls --color=auto -lAS --block-size=1M'
		alias         ll-asG='ls --color=auto -lAS --block-size=1G'

		alias          ll-at='ls --color=auto -lAt --human-readable'
		alias         ll-atB='ls --color=auto -lAt'
		alias         ll-atK='ls --color=auto -lAt --block-size=1K'
		alias         ll-atM='ls --color=auto -lAt --block-size=1M'
		alias         ll-atG='ls --color=auto -lAt --block-size=1G'

		alias         ll-ars='ls --color=auto -lArS --human-readable'
		alias        ll-arsB='ls --color=auto -lArS'
		alias        ll-arsK='ls --color=auto -lArS --block-size=1K'
		alias        ll-arsM='ls --color=auto -lArS --block-size=1M'
		alias        ll-arsG='ls --color=auto -lArS --block-size=1G'

		alias         ll-art='ls --color=auto -lArt --human-readable'
		alias        ll-artB='ls --color=auto -lArt'
		alias        ll-artK='ls --color=auto -lArt --block-size=1K'
		alias        ll-artM='ls --color=auto -lArt --block-size=1M'
		alias        ll-artG='ls --color=auto -lArt --block-size=1G'

		alias          ll-ag='ls --color=auto -lA --group-directories-first --human-readable'
		alias         ll-agB='ls --color=auto -lA --group-directories-first'
		alias         ll-agK='ls --color=auto -lA --group-directories-first --block-size=1K'
		alias         ll-agM='ls --color=auto -lA --group-directories-first --block-size=1M'
		alias         ll-agG='ls --color=auto -lA --group-directories-first --block-size=1G'

		alias         ll-ags='ls --color=auto -lAS --group-directories-first --human-readable'
		alias        ll-agsB='ls --color=auto -lAS --group-directories-first'
		alias        ll-agsK='ls --color=auto -lAS --group-directories-first --block-size=1K'
		alias        ll-agsM='ls --color=auto -lAS --group-directories-first --block-size=1M'
		alias        ll-agsG='ls --color=auto -lAS --group-directories-first --block-size=1G'

		alias         ll-agt='ls --color=auto -lAt --group-directories-first --human-readable'
		alias        ll-agtB='ls --color=auto -lAt --group-directories-first'
		alias        ll-agtK='ls --color=auto -lAt --group-directories-first --block-size=1K'
		alias        ll-agtM='ls --color=auto -lAt --group-directories-first --block-size=1M'
		alias        ll-agtG='ls --color=auto -lAt --group-directories-first --block-size=1G'

		alias        ll-agrs='ls --color=auto -lArS --group-directories-first --human-readable'
		alias       ll-agrsB='ls --color=auto -lArS --group-directories-first'
		alias       ll-agrsK='ls --color=auto -lArS --group-directories-first --block-size=1K'
		alias       ll-agrsM='ls --color=auto -lArS --group-directories-first --block-size=1M'
		alias       ll-agrsG='ls --color=auto -lArS --group-directories-first --block-size=1G'

		alias        ll-agrt='ls --color=auto -lArt --group-directories-first --human-readable'
		alias       ll-agrtB='ls --color=auto -lArt --group-directories-first'
		alias       ll-agrtK='ls --color=auto -lArt --group-directories-first --block-size=1K'
		alias       ll-agrtM='ls --color=auto -lArt --group-directories-first --block-size=1M'
		alias       ll-agrtG='ls --color=auto -lArt --group-directories-first --block-size=1G'

		alias          ll-ax='ls --color=auto -lAX --group-directories-first --human-readable'
		alias         ll-axB='ls --color=auto -lAX --group-directories-first'
		alias         ll-axK='ls --color=auto -lAX --group-directories-first --block-size=1K'
		alias         ll-axM='ls --color=auto -lAX --group-directories-first --block-size=1M'
		alias         ll-axG='ls --color=auto -lAX --group-directories-first --block-size=1G'

		alias       ll-color='ls --color=always -l --human-readable'
		alias     ll-B-color='ls --color=always -l'
		alias     ll-K-color='ls --color=always -l --block-size=1K'
		alias     ll-M-color='ls --color=always -l --block-size=1M'
		alias     ll-G-color='ls --color=always -l --block-size=1G'

		alias     ll-s-color='ls --color=always -lS --human-readable'
		alias    ll-sB-color='ls --color=always -lS'
		alias    ll-sK-color='ls --color=always -lS --block-size=1K'
		alias    ll-sM-color='ls --color=always -lS --block-size=1M'
		alias    ll-sG-color='ls --color=always -lS --block-size=1G'

		alias     ll-t-color='ls --color=always -lt --human-readable'
		alias    ll-tB-color='ls --color=always -lt'
		alias    ll-tK-color='ls --color=always -lt --block-size=1K'
		alias    ll-tM-color='ls --color=always -lt --block-size=1M'
		alias    ll-tG-color='ls --color=always -lt --block-size=1G'

		alias    ll-rs-color='ls --color=always -lrS --human-readable'
		alias   ll-rsB-color='ls --color=always -lrS'
		alias   ll-rsK-color='ls --color=always -lrS --block-size=1K'
		alias   ll-rsM-color='ls --color=always -lrS --block-size=1M'
		alias   ll-rsG-color='ls --color=always -lrS --block-size=1G'

		alias    ll-rt-color='ls --color=always -lrt --human-readable'
		alias   ll-rtB-color='ls --color=always -lrt'
		alias   ll-rtK-color='ls --color=always -lrt --block-size=1K'
		alias   ll-rtM-color='ls --color=always -lrt --block-size=1M'
		alias   ll-rtG-color='ls --color=always -lrt --block-size=1G'

		alias     ll-g-color='ls --color=always -l --group-directories-first --human-readable'
		alias    ll-gB-color='ls --color=always -l --group-directories-first'
		alias    ll-gK-color='ls --color=always -l --group-directories-first --block-size=1K'
		alias    ll-gM-color='ls --color=always -l --group-directories-first --block-size=1M'
		alias    ll-gG-color='ls --color=always -l --group-directories-first --block-size=1G'

		alias    ll-gs-color='ls --color=always -lS --group-directories-first --human-readable'
		alias   ll-gsB-color='ls --color=always -lS --group-directories-first'
		alias   ll-gsK-color='ls --color=always -lS --group-directories-first --block-size=1K'
		alias   ll-gsM-color='ls --color=always -lS --group-directories-first --block-size=1M'
		alias   ll-gsG-color='ls --color=always -lS --group-directories-first --block-size=1G'

		alias    ll-gt-color='ls --color=always -lt --group-directories-first --human-readable'
		alias   ll-gtB-color='ls --color=always -lt --group-directories-first'
		alias   ll-gtK-color='ls --color=always -lt --group-directories-first --block-size=1K'
		alias   ll-gtM-color='ls --color=always -lt --group-directories-first --block-size=1M'
		alias   ll-gtG-color='ls --color=always -lt --group-directories-first --block-size=1G'

		alias   ll-grs-color='ls --color=always -lrS --group-directories-first --human-readable'
		alias  ll-grsB-color='ls --color=always -lrS --group-directories-first'
		alias  ll-grsK-color='ls --color=always -lrS --group-directories-first --block-size=1K'
		alias  ll-grsM-color='ls --color=always -lrS --group-directories-first --block-size=1M'
		alias  ll-grsG-color='ls --color=always -lrS --group-directories-first --block-size=1G'

		alias   ll-grt-color='ls --color=always -lrt --group-directories-first --human-readable'
		alias  ll-grtB-color='ls --color=always -lrt --group-directories-first'
		alias  ll-grtK-color='ls --color=always -lrt --group-directories-first --block-size=1K'
		alias  ll-grtM-color='ls --color=always -lrt --group-directories-first --block-size=1M'
		alias  ll-grtG-color='ls --color=always -lrt --group-directories-first --block-size=1G'

		alias     ll-x-color='ls --color=always -lX --group-directories-first --human-readable'
		alias    ll-xB-color='ls --color=always -lX --group-directories-first'
		alias    ll-xK-color='ls --color=always -lX --group-directories-first --block-size=1K'
		alias    ll-xM-color='ls --color=always -lX --group-directories-first --block-size=1M'
		alias    ll-xG-color='ls --color=always -lX --group-directories-first --block-size=1G'

		alias     ll-a-color='ls --color=always -lA --human-readable'
		alias    ll-aB-color='ls --color=always -lA'
		alias    ll-aK-color='ls --color=always -lA --block-size=1K'
		alias    ll-aM-color='ls --color=always -lA --block-size=1M'
		alias    ll-aG-color='ls --color=always -lA --block-size=1G'

		alias    ll-as-color='ls --color=always -lAS --human-readable'
		alias   ll-asB-color='ls --color=always -lAS'
		alias   ll-asK-color='ls --color=always -lAS --block-size=1K'
		alias   ll-asM-color='ls --color=always -lAS --block-size=1M'
		alias   ll-asG-color='ls --color=always -lAS --block-size=1G'

		alias    ll-at-color='ls --color=always -lAt --human-readable'
		alias   ll-atB-color='ls --color=always -lAt'
		alias   ll-atK-color='ls --color=always -lAt --block-size=1K'
		alias   ll-atM-color='ls --color=always -lAt --block-size=1M'
		alias   ll-atG-color='ls --color=always -lAt --block-size=1G'

		alias   ll-ars-color='ls --color=always -lArS --human-readable'
		alias  ll-arsB-color='ls --color=always -lArS'
		alias  ll-arsK-color='ls --color=always -lArS --block-size=1K'
		alias  ll-arsM-color='ls --color=always -lArS --block-size=1M'
		alias  ll-arsG-color='ls --color=always -lArS --block-size=1G'

		alias   ll-art-color='ls --color=always -lArt --human-readable'
		alias  ll-artB-color='ls --color=always -lArt'
		alias  ll-artK-color='ls --color=always -lArt --block-size=1K'
		alias  ll-artM-color='ls --color=always -lArt --block-size=1M'
		alias  ll-artG-color='ls --color=always -lArt --block-size=1G'

		alias    ll-ag-color='ls --color=always -lA --group-directories-first --human-readable'
		alias   ll-agB-color='ls --color=always -lA --group-directories-first'
		alias   ll-agK-color='ls --color=always -lA --group-directories-first --block-size=1K'
		alias   ll-agM-color='ls --color=always -lA --group-directories-first --block-size=1M'
		alias   ll-agG-color='ls --color=always -lA --group-directories-first --block-size=1G'

		alias   ll-ags-color='ls --color=always -lAS --group-directories-first --human-readable'
		alias  ll-agsB-color='ls --color=always -lAS --group-directories-first'
		alias  ll-agsK-color='ls --color=always -lAS --group-directories-first --block-size=1K'
		alias  ll-agsM-color='ls --color=always -lAS --group-directories-first --block-size=1M'
		alias  ll-agsG-color='ls --color=always -lAS --group-directories-first --block-size=1G'

		alias   ll-agt-color='ls --color=always -lAt --group-directories-first --human-readable'
		alias  ll-agtB-color='ls --color=always -lAt --group-directories-first'
		alias  ll-agtK-color='ls --color=always -lAt --group-directories-first --block-size=1K'
		alias  ll-agtM-color='ls --color=always -lAt --group-directories-first --block-size=1M'
		alias  ll-agtG-color='ls --color=always -lAt --group-directories-first --block-size=1G'

		alias  ll-agrs-color='ls --color=always -lArS --group-directories-first --human-readable'
		alias ll-agrsB-color='ls --color=always -lArS --group-directories-first'
		alias ll-agrsK-color='ls --color=always -lArS --group-directories-first --block-size=1K'
		alias ll-agrsM-color='ls --color=always -lArS --group-directories-first --block-size=1M'
		alias ll-agrsG-color='ls --color=always -lArS --group-directories-first --block-size=1G'

		alias  ll-agrt-color='ls --color=always -lArt --group-directories-first --human-readable'
		alias ll-agrtB-color='ls --color=always -lArt --group-directories-first'
		alias ll-agrtK-color='ls --color=always -lArt --group-directories-first --block-size=1K'
		alias ll-agrtM-color='ls --color=always -lArt --group-directories-first --block-size=1M'
		alias ll-agrtG-color='ls --color=always -lArt --group-directories-first --block-size=1G'

		alias    ll-ax-color='ls --color=always -lAX --group-directories-first --human-readable'
		alias   ll-axB-color='ls --color=always -lAX --group-directories-first'
		alias   ll-axK-color='ls --color=always -lAX --group-directories-first --block-size=1K'
		alias   ll-axM-color='ls --color=always -lAX --group-directories-first --block-size=1M'
		alias   ll-axG-color='ls --color=always -lAX --group-directories-first --block-size=1G'
	else
		# non-GNU ls

		# ls base
		alias            ls='ls -G'
		alias      ls-color='CLICOLOR_FORCE=1 ls -G'

		# la base
		alias            la='ls -G -A'
		alias      la-color='CLICOLOR_FORCE=1 ls -A'

		# l1 base
		alias            l1='ls -G -1'
		alias          l1-a='ls -G -1A'

		alias      l1-color='CLICOLOR_FORCE=1 ls -1'
		alias    l1-a-color='CLICOLOR_FORCE=1 ls -1A'

		# ll base
		alias            ll='ls -G -lh'
		alias          ll-B='ls -G -l'
		alias          ll-K='BLOCKSIZE=1024 ls -G -l '
		alias          ll-M='BLOCKSIZE=1048576 ls -G -l '
		alias          ll-G='BLOCKSIZE=1073741824 ls -G -l '

		alias          ll-s='ls -G -lhS'
		alias         ll-sB='ls -G -lS'
		alias         ll-sK='BLOCKSIZE=1024 ls -G -lS '
		alias         ll-sM='BLOCKSIZE=1048576 ls -G -lS '
		alias         ll-sG='BLOCKSIZE=1073741824 ls -G -lS '

		alias          ll-t='ls -G -lht'
		alias         ll-tB='ls -G -lt'
		alias         ll-tK='BLOCKSIZE=1024 ls -G -lt '
		alias         ll-tM='BLOCKSIZE=1048576 ls -G -lt '
		alias         ll-tG='BLOCKSIZE=1073741824 ls -G -lt '

		alias         ll-rs='ls -G -lhrS'
		alias        ll-rsB='ls -G -lrS'
		alias        ll-rsK='BLOCKSIZE=1024 ls -G -lrS '
		alias        ll-rsM='BLOCKSIZE=1048576 ls -G -lrS '
		alias        ll-rsG='BLOCKSIZE=1073741824 ls -G -lrS '

		alias         ll-rt='ls -G -lhrt'
		alias        ll-rtB='ls -G -lrt'
		alias        ll-rtK='BLOCKSIZE=1024 ls -G -lrt '
		alias        ll-rtM='BLOCKSIZE=1048576 ls -G -lrt '
		alias        ll-rtG='BLOCKSIZE=1073741824 ls -G -lrt '

		alias          ll-a='ls -G -lAh'
		alias         ll-aB='ls -G -lA'
		alias         ll-aK='BLOCKSIZE=1024 ls -G -lA '
		alias         ll-aM='BLOCKSIZE=1048576 ls -G -lA '
		alias         ll-aG='BLOCKSIZE=1073741824 ls -G -lA '

		alias         ll-as='ls -G -lAhS'
		alias        ll-asB='ls -G -lAS'
		alias        ll-asK='BLOCKSIZE=1024 ls -G -lAS '
		alias        ll-asM='BLOCKSIZE=1048576 ls -G -lAS '
		alias        ll-asG='BLOCKSIZE=1073741824 ls -G -lAS '

		alias         ll-at='ls -G -lAht'
		alias        ll-atB='ls -G -lAt'
		alias        ll-atK='BLOCKSIZE=1024 ls -G -lAt '
		alias        ll-atM='BLOCKSIZE=1048576 ls -G -lAt '
		alias        ll-atG='BLOCKSIZE=1073741824 ls -G -lAt '

		alias        ll-ars='ls -G -lAhrS'
		alias       ll-arsB='ls -G -lArS'
		alias       ll-arsK='BLOCKSIZE=1024 ls -G -lArS '
		alias       ll-arsM='BLOCKSIZE=1048576 ls -G -lArS '
		alias       ll-arsG='BLOCKSIZE=1073741824 ls -G -lArS '

		alias        ll-art='ls -G -lAhrt'
		alias       ll-artB='ls -G -lArt'
		alias       ll-artK='BLOCKSIZE=1024 ls -G -lArt '
		alias       ll-artM='BLOCKSIZE=1048576 ls -G -lArt '
		alias       ll-artG='BLOCKSIZE=1073741824 ls -G -lArt '

		alias     ll-color='CLICOLOR_FORCE=1 ls -lh'
		alias    ll-B-color='CLICOLOR_FORCE=1 ls -l'
		alias    ll-K-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -l'
		alias    ll-M-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -l'
		alias    ll-G-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -l'

		alias    ll-s-color='CLICOLOR_FORCE=1 ls -lhS'
		alias   ll-sB-color='CLICOLOR_FORCE=1 ls -lS'
		alias   ll-sK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lS'
		alias   ll-sM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lS'
		alias   ll-sG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lS'

		alias    ll-t-color='CLICOLOR_FORCE=1 ls -lht'
		alias   ll-tB-color='CLICOLOR_FORCE=1 ls -lt'
		alias   ll-tK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lt'
		alias   ll-tM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lt'
		alias   ll-tG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lt'

		alias   ll-rs-color='CLICOLOR_FORCE=1 ls -lhrS'
		alias  ll-rsB-color='CLICOLOR_FORCE=1 ls -lrS'
		alias  ll-rsK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lrS'
		alias  ll-rsM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lrS'
		alias  ll-rsG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lrS'

		alias   ll-rt-color='CLICOLOR_FORCE=1 ls -lhrt'
		alias  ll-rtB-color='CLICOLOR_FORCE=1 ls -lrt'
		alias  ll-rtK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lrt'
		alias  ll-rtM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lrt'
		alias  ll-rtG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lrt'

		alias    lla-color='CLICOLOR_FORCE=1 ls -lAh'
		alias   ll-aB-color='CLICOLOR_FORCE=1 ls -lA'
		alias   ll-aK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lA'
		alias   ll-aM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lA'
		alias   ll-aG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lA'

		alias   ll-as-color='CLICOLOR_FORCE=1 ls -lAhS'
		alias  ll-asB-color='CLICOLOR_FORCE=1 ls -lAS'
		alias  ll-asK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lAS'
		alias  ll-asM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lAS'
		alias  ll-asG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lAS'

		alias   ll-at-color='CLICOLOR_FORCE=1 ls -lAht'
		alias  ll-atB-color='CLICOLOR_FORCE=1 ls -lAt'
		alias  ll-atK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lAt'
		alias  ll-atM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lAt'
		alias  ll-atG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lAt'

		alias  ll-ars-color='CLICOLOR_FORCE=1 ls -lAhrS'
		alias ll-arsB-color='CLICOLOR_FORCE=1 ls -lArS'
		alias ll-arsK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lArS'
		alias ll-arsM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lArS'
		alias ll-arsG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lArS'

		alias  ll-art-color='CLICOLOR_FORCE=1 ls -lAhrt'
		alias ll-artB-color='CLICOLOR_FORCE=1 ls -lArt'
		alias ll-artK-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lArt'
		alias ll-artM-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lArt'
		alias ll-artG-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lArt'
	fi
fi

# lsblk
if   which lsblk > /dev/null 2>&1
then
	alias lsblk-disk='lsblk -dp -o NAME,GROUP,TRAN,VENDOR,MODEL,REV,SERIAL,SIZE,PHY-SEC,LOG-SEC,ZONED,SCHED'
	alias lsblk-part='lsblk  -p -o NAME,PTTYPE,TYPE,SIZE,PARTTYPE,PARTTYPENAME,PARTFLAGS,PARTLABEL,MOUNTPOINTS'
	alias   lsblk-fs='lsblk  -p -o NAME,TYPE,FSTYPE,SIZE,FSSIZE,FSUSED,FSAVAIL,FSUSE%,LABEL,PARTLABEL,MOUNTPOINTS'
fi

# mkfs.btrfs
if   which mkfs.btrfs > /dev/null 2>&1
then
	alias mkfs.btrfs-config-single='mkfs.btrfs \
--data=single \
--metadata=single \
'
	alias mkfs.btrfs-config-dup='mkfs.btrfs \
--data=dup \
--metadata=dup \
'
	alias mkfs.btrfs-list-all='mkfs.btrfs -O list-all'
elif [[ -f '/usr/sbin/mkfs.btrfs' ]]
then
	alias mkfs.btrfs-list-all='/usr/sbin/mkfs.btrfs -O list-all'
fi

# mkfs.exfat
if   which mkfs.exfat > /dev/null 2>&1
then
	alias   mkfs.exfat-config-sd-8MiB='mkfs.exfat -b  8k -c   8k'
	alias  mkfs.exfat-config-sd-64MiB='mkfs.exfat -b 16k -c  16k'
	alias mkfs.exfat-config-sd-256MiB='mkfs.exfat -b 32k -c  16k'
	alias   mkfs.exfat-config-sd-1GiB='mkfs.exfat -b 64k -c  16k'
	alias   mkfs.exfat-config-sd-2GiB='mkfs.exfat -b 64k -c  32k'
	alias  mkfs.exfat-config-sd-32GiB='mkfs.exfat -b  4m -c  32k'
	alias mkfs.exfat-config-sd-128GiB='mkfs.exfat -b 16m -c 128k'
	alias mkfs.exfat-config-sd-512GiB='mkfs.exfat -b 32m -c 256k'
	alias   mkfs.exfat-config-sd-2TiB='mkfs.exfat -b 64m -c 512k'
fi

# mkfs.f2fs
if   which mkfs.f2fs > /dev/null 2>&1
then
	alias mkfs.f2fs-config-default='mkfs.btrfs \
	-e \
jp,mp,og,wm,\
avi,m4p,m4v,mkv,mov,webm,\
3gp,flac,m4a,opus,wav,\
gif,png,svg,webp,\
7z,bz2,deb,gz,iso,jar,rar,rpm,tar,xz,zst,\
pdf,pyc,ttc,ttf,exe,\
apk,cnt,exo,odex,vdex,so\
	-E \
db,sqlite,\
qcow2,vdi,vmdk\
	-O compression,extra_attr,inode_checksum,flexible_inline_xattr,sb_checksum
'
fi

if   ! which mount.f2fs > /dev/null 2>&1
then
	alias mount.f2fs='mount -t f2fs \
	-o \
atgc,
compress_algorithm=zstd:6,\
compress_extension=txt,
compress_chksum,\
'
fi

# mkfs.fat
if   which mkfs.fat > /dev/null 2>&1
then
	which mkfs.fat12 > /dev/null 2>&1 || alias mkfs.fat12='mkfs.fat -F 12'
	which mkfs.fat16 > /dev/null 2>&1 || alias mkfs.fat12='mkfs.fat -F 16'
	which mkfs.fat32 > /dev/null 2>&1 || alias mkfs.fat12='mkfs.fat -F 32'
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
fi

# stat
if   which stat > /dev/null 2>&1
then
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
