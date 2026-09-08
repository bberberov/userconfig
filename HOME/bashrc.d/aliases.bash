# shellcheck disable=SC2139

case "${-:-}" in *i* )  # BEGIN Interactive only

# bat
if   type -fP 'bat' > '/dev/null' 2>&1
then
	alias bat-color='bat --color always --terminal-width ${COLUMNS}'
fi

# cd
alias     cd.='cd ..'
alias    cd..='cd ../..'
alias   cd...='cd ../../..'
alias  cd....='cd ../../../..'
alias cd.....='cd ../../../../..'

alias cd3u='cd ../../..'
alias cd4u='cd ../../../..'
alias cd5u='cd ../../../../..'
alias cd6u='cd ../../../../../..'
alias cd7u='cd ../../../../../../..'
alias cd8u='cd ../../../../../../../..'
alias cd9u='cd ../../../../../../../../..'

alias cd-config=fn_cd_config
alias   cd-user=fn_cd_user
alias    cd-xdg=fn_cd_xdg

alias cd-sudo-home='cd "${SUDO_HOME:-${HOME}}"'

# delta
if   type -fP 'delta' > '/dev/null' 2>&1
then
	alias delta-y='delta --features=diffy'
fi

# df
if   type -fP 'df' > '/dev/null' 2>&1
then
	if   command df --version > '/dev/null' 2>&1
	then
		# GNU df
		alias        df='df -h'
		alias   df-long='df -h --output=source,fstype,itotal,iused,ipcent,iavail,target,size,used,pcent,avail'
		alias df-blocks='df -h --output=source,target,size,used,pcent,avail'
		alias df-inodes='df -h --output=source,target,itotal,iused,ipcent,iavail'
		alias   df-free='df -h --output=source,target,iavail,avail'
		alias   df-used='df -h --output=source,target,ipcent,pcent'
		alias   df-long-color='df-color -h --output=source,fstype,itotal,iused,ipcent,iavail,target,size,used,pcent,avail'
		alias df-blocks-color='df-color -h --output=source,target,size,used,pcent,avail'
		alias df-inodes-color='df-color -h --output=source,target,itotal,iused,ipcent,iavail'
		alias   df-free-color='df-color -h --output=source,target,iavail,avail'
		alias   df-used-color='df-color -h --output=source,target,ipcent,pcent'

		alias   df-long-disk='df -h --output=source,fstype,itotal,iused,ipcent,iavail,target,size,used,pcent,avail             -l -x efivarfs -x devtmpfs -x tmpfs'
		alias df-blocks-disk='df -h --output=source,target,size,used,pcent,avail                                               -l -x efivarfs -x devtmpfs -x tmpfs'
		alias df-inodes-disk='df -h --output=source,target,itotal,iused,ipcent,iavail                                          -l -x efivarfs -x devtmpfs -x tmpfs'
		alias   df-free-disk='df -h --output=source,target,iavail,avail                                                        -l -x efivarfs -x devtmpfs -x tmpfs'
		alias   df-used-disk='df -h --output=source,target,ipcent,pcent                                                        -l -x efivarfs -x devtmpfs -x tmpfs'
		alias   df-long-disk-color='df-color -h --output=source,fstype,itotal,iused,ipcent,iavail,target,size,used,pcent,avail -l -x efivarfs -x devtmpfs -x tmpfs'
		alias df-blocks-disk-color='df-color -h --output=source,target,size,used,pcent,avail                                   -l -x efivarfs -x devtmpfs -x tmpfs'
		alias df-inodes-disk-color='df-color -h --output=source,target,itotal,iused,ipcent,iavail                              -l -x efivarfs -x devtmpfs -x tmpfs'
		alias   df-free-disk-color='df-color -h --output=source,target,iavail,avail                                            -l -x efivarfs -x devtmpfs -x tmpfs'
		alias   df-used-disk-color='df-color -h --output=source,target,ipcent,pcent                                            -l -x efivarfs -x devtmpfs -x tmpfs'
	else
		# non-GNU df
		alias        df='df -Ph'
		alias   df-long='df -hi'
		alias        df-color='df-color -Ph'
		alias   df-long-color='df-color -hi'
	fi
fi

# diff
if   type -fP 'diff' > '/dev/null' 2>&1
then
	alias         diff='diff --color=auto'
	alias       diff-y='diff --color=auto -y'
	alias   diff-color='diff --color=always'
	alias diff-y-color='diff --color=always -y'
fi

# difft
if   type -fP 'difft' > '/dev/null' 2>&1
then
	alias difft-y='difft --display side-by-side'
	alias   difft-color='difft --color always --width ${COLUMNS}'
	alias difft-y-color='difft --color always --width ${COLUMNS} --display side-by-side'
fi

# eza (as ela)
if   type -fP 'eza' > '/dev/null' 2>&1
then
	alias     eza='eza --group-directories-first -b'

	alias     ela='eza --group-directories-first -bg'
	alias    elaa='eza --group-directories-first -bgA'

	alias    elaz='eza --group-directories-first -lZ --no-permissions --no-filesize --no-user --no-time'

	alias    elal='eza --group-directories-first -bgl'
	alias   elalz='eza --group-directories-first -bglZ'
	alias  elalrs='eza --group-directories-first -bglr --sort=size'
	alias  elalrt='eza --group-directories-first -bglr --sort=modified'
	alias   elalx='eza --group-directories-first -bgl  --sort=extension'
	alias  elalxz='eza --group-directories-first -bglZ --sort=extension'
	alias   elala='eza --group-directories-first -bglA'
	alias  elalaz='eza --group-directories-first -bglAZ'
	alias elalars='eza --group-directories-first -bglAr --sort=size'
	alias elalart='eza --group-directories-first -bglAr --sort=modified'
	alias  elalax='eza --group-directories-first -bglA  --sort=extension'
	alias elalaxz='eza --group-directories-first -bglAZ --sort=extension'

	alias    elat='eza --group-directories-first -bgT'
	alias   elatd='eza --group-directories-first -bgTD'
	alias   elata='eza --group-directories-first -bgTA'
	alias  elatad='eza --group-directories-first -bgTAD'
	alias   elalt='eza --group-directories-first -bgTl'
	alias  elaltd='eza --group-directories-first -bgTlD'
	alias  elaltz='eza --group-directories-first -bgTlZ'
	alias  elalta='eza --group-directories-first -bgTlA'
	alias elaltad='eza --group-directories-first -bgTlAD'
	alias elaltaz='eza --group-directories-first -bgTlAZ'

	alias     eza-color='eza --color=always --group-directories-first -b'

	alias     ela-color='eza --color=always --group-directories-first -bg'
	alias    elaa-color='eza --color=always --group-directories-first -bgA'

	alias    elaz-color='eza --color=always --group-directories-first -lZ --no-permissions --no-filesize --no-user --no-time'

	alias    elal-color='eza --color=always --group-directories-first -bgl'
	alias   elalz-color='eza --color=always --group-directories-first -bglZ'
	alias  elalrs-color='eza --color=always --group-directories-first -bglr --sort=size'
	alias  elalrt-color='eza --color=always --group-directories-first -bglr --sort=modified'
	alias   elalx-color='eza --color=always --group-directories-first -bgl  --sort=extension'
	alias  elalxz-color='eza --color=always --group-directories-first -bglZ --sort=extension'
	alias   elala-color='eza --color=always --group-directories-first -bglA'
	alias  elalaz-color='eza --color=always --group-directories-first -bglAZ'
	alias elalars-color='eza --color=always --group-directories-first -bglAr --sort=size'
	alias elalart-color='eza --color=always --group-directories-first -bglAr --sort=modified'
	alias  elalax-color='eza --color=always --group-directories-first -bglA  --sort=extension'
	alias elalaxz-color='eza --color=always --group-directories-first -bglAZ --sort=extension'

	alias    elat-color='eza --color=always --group-directories-first -bgT'
	alias   elatd-color='eza --color=always --group-directories-first -bgTD'
	alias   elata-color='eza --color=always --group-directories-first -bgTA'
	alias  elatad-color='eza --color=always --group-directories-first -bgTAD'
	alias   elalt-color='eza --color=always --group-directories-first -bgTl'
	alias  elaltd-color='eza --color=always --group-directories-first -bgTlD'
	alias  elaltz-color='eza --color=always --group-directories-first -bgTlZ'
	alias  elalta-color='eza --color=always --group-directories-first -bgTlA'
	alias elaltad-color='eza --color=always --group-directories-first -bgTlAD'
	alias elaltaz-color='eza --color=always --group-directories-first -bgTlAZ'

	for (( i=2 ; i < 9 ; i+=1 ))
	do
		alias    "elat${i}"="eza --group-directories-first -bgT    -L ${i}"
		alias   "elatd${i}"="eza --group-directories-first -bgTD   -L ${i}"
		alias   "elata${i}"="eza --group-directories-first -bgTA   -L ${i}"
		alias  "elatad${i}"="eza --group-directories-first -bgTAD  -L ${i}"
		alias   "elalt${i}"="eza --group-directories-first -bgTl   -L ${i}"
		alias  "elaltd${i}"="eza --group-directories-first -bgTlD  -L ${i}"
		alias  "elalta${i}"="eza --group-directories-first -bgTlA  -L ${i}"
		alias "elaltad${i}"="eza --group-directories-first -bgTlAD -L ${i}"

		alias    "elat${i}-color"="eza --color=always --group-directories-first -bgT    -L ${i}"
		alias   "elatd${i}-color"="eza --color=always --group-directories-first -bgTD   -L ${i}"
		alias   "elata${i}-color"="eza --color=always --group-directories-first -bgTA   -L ${i}"
		alias  "elatad${i}-color"="eza --color=always --group-directories-first -bgTAD  -L ${i}"
		alias   "elalt${i}-color"="eza --color=always --group-directories-first -bgTl   -L ${i}"
		alias  "elaltd${i}-color"="eza --color=always --group-directories-first -bgTlD  -L ${i}"
		alias  "elalta${i}-color"="eza --color=always --group-directories-first -bgTlA  -L ${i}"
		alias "elaltad${i}-color"="eza --color=always --group-directories-first -bgTlAD -L ${i}"
	done
fi

# fd
if   type -fP 'fd' > '/dev/null' 2>&1
then
	alias fd-color='fd --color=always'
fi

# findmnt
if   type -fP 'findmnt' > '/dev/null' 2>&1
then
	alias         lsmount='findmnt -o SOURCE,TARGET,FSTYPE,OPTIONS'
	alias     lsmount-opt='findmnt -o SOURCE,TARGET,VFS-OPTIONS,FS-OPTIONS'
	alias     lsmount-vfs='findmnt --vfs-all -o SOURCE,TARGET,VFS-OPTIONS'
	alias    lsmount-tree='findmnt -o SOURCE,FSTYPE,TARGET'

	alias          lsdisk='findmnt -o SOURCE,TARGET,FSTYPE,OPTIONS --real'
	alias      lsdisk-opt='findmnt -o SOURCE,TARGET,VFS-OPTIONS,FS-OPTIONS --real'
	alias      lsdisk-vfs='findmnt --vfs-all -o SOURCE,TARGET,VFS-OPTIONS --real'
	alias     lsdisk-tree='findmnt -o SOURCE,FSTYPE,TARGET --real'

	alias         lsfstab='findmnt --fstab -o SOURCE,TARGET,FSTYPE,OPTIONS,FREQ,PASSNO'
	alias     lsfstab-opt='findmnt --fstab -o SOURCE,TARGET,FSTYPE,VFS-OPTIONS,FS-OPTIONS,FREQ,PASSNO'
	alias     lsfstab-dev='findmnt --fstab -e -o SOURCE,TARGET,FSTYPE,OPTIONS,FREQ,PASSNO'
	alias lsfstab-dev-opt='findmnt --fstab -e -o SOURCE,TARGET,FSTYPE,VFS-OPTIONS,FS-OPTIONS,FREQ,PASSNO'
fi

# git
if   type -fP 'git' > '/dev/null' 2>&1
then
	alias cd-git-repo=fn_cd_git_repo
	alias cd-git-tree=fn_cd_git_tree
	alias cd-git-tree-config=fn_cd_git_tree_config

	alias      diff-git='git diff --no-index'
	alias diffchart-git='git diff --no-index --stat --stat-name-width=30'
	alias  diffstat-git='git diff --no-index --stat'
	alias   dirstat-git='git diff --no-index --dirstat'
	alias  linestat-git='git diff --no-index --shortstat'
fi

# grep
if   type -fP 'grep' > '/dev/null' 2>&1
then
	alias        grep='grep --color=auto'
	alias  grep-color='grep --color=always'
	alias       Egrep='grep --color=auto -E'
	alias Egrep-color='grep --color=always -E'
	alias       Fgrep='grep --color=auto -F'
	alias Fgrep-color='grep --color=always -F'
	alias       Sgrep='grep --color=auto -F'
	alias Sgrep-color='grep --color=always -F'

	for (( i=1 ; i < 9 ; i+=1 ))
	do
		alias "grep${i}"="grep --context=${i}"
		alias "grep${i}-color"="grep --color=always --context=${i}"
	done
fi

# hostname
if   type -fP 'hostname' > '/dev/null' 2>&1
then
	alias hostnames='hostname --all-fqdns'
fi

# ip
if   type -fP 'ip' > '/dev/null' 2>&1
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

# jq
if   type -fP 'jq' > '/dev/null' 2>&1
then
	alias jq-color='jq --color-output'
fi

#
# KDE
#
if   type -fP 'kstart' > '/dev/null' 2>&1
then
	if   type -fP 'dolphin' > '/dev/null' 2>&1
	then
		alias dolphin-here='kstart -- dolphin "$(pwd)"'
	fi

	if   type -fP 'konsole' > '/dev/null' 2>&1
	then
		alias konsole-here='kstart -- konsole --workdir "$(pwd)"'
	fi
fi

# less

# NOTE: less is in its own bashrc.d/less.bash file

# ls
if   type -fP 'ls' > '/dev/null' 2>&1
then
	if   command ls --version > '/dev/null' 2>&1
	then
		# GNU ls

		# ls base
		alias             ls='ls --color=auto'
		alias             lg='ls --color=auto    --group-directories-first'
		alias             lx='ls --color=auto -X --group-directories-first'

		alias       ls-color='ls --color=always'
		alias       lg-color='ls --color=always    --group-directories-first'
		alias       lx-color='ls --color=always -X --group-directories-first'

		# la base
		alias             la='ls --color=auto -A'
		alias            lag='ls --color=auto -A  --group-directories-first'
		alias            lax='ls --color=auto -AX --group-directories-first'

		alias       la-color='ls --color=always -A'
		alias      lag-color='ls --color=always -A  --group-directories-first'
		alias      lax-color='ls --color=always -AX --group-directories-first'

		# l1 base
		alias             l1='ls --color=auto -1'
		alias            l1g='ls --color=auto -1  --group-directories-first'
		alias            l1x='ls --color=auto -1X --group-directories-first'

		alias            l1a='ls --color=auto -1A'
		alias           l1ag='ls --color=auto -1A  --group-directories-first'
		alias           l1ax='ls --color=auto -1AX --group-directories-first'

		alias       l1-color='ls --color=always -1'
		alias      l1g-color='ls --color=always -1  --group-directories-first'
		alias      l1x-color='ls --color=always -1X --group-directories-first'

		alias      l1a-color='ls --color=always -1A'
		alias     l1ag-color='ls --color=always -1A  --group-directories-first'
		alias     l1ax-color='ls --color=always -1AX --group-directories-first'

		# ll base
		alias             ll='ls --color=auto -l   --human-readable'
		alias            llz='ls --color=auto -lZ  --human-readable'
		alias           llrs='ls --color=auto -lrS --human-readable'
		alias           llrt='ls --color=auto -lrt --human-readable'
		alias            llg='ls --color=auto -l   --group-directories-first --human-readable'
		alias           llgz='ls --color=auto -lZ  --group-directories-first --human-readable'
		alias          llrsg='ls --color=auto -lrS --group-directories-first --human-readable'
		alias          llrtg='ls --color=auto -lrt --group-directories-first --human-readable'
		alias            llx='ls --color=auto -lX  --group-directories-first --human-readable'
		alias           llxz='ls --color=auto -lXZ --group-directories-first --human-readable'

		alias            lla='ls --color=auto -lA   --human-readable'
		alias           llaz='ls --color=auto -lAZ  --human-readable'
		alias          llars='ls --color=auto -lArS --human-readable'
		alias          llart='ls --color=auto -lArt --human-readable'
		alias           llag='ls --color=auto -lA   --group-directories-first --human-readable'
		alias          llagz='ls --color=auto -lAZ  --group-directories-first --human-readable'
		alias         llarsg='ls --color=auto -lArS --group-directories-first --human-readable'
		alias         llartg='ls --color=auto -lArt --group-directories-first --human-readable'
		alias           llax='ls --color=auto -lAX  --group-directories-first --human-readable'
		alias          llaxz='ls --color=auto -lAXZ --group-directories-first --human-readable'

		alias       ll-color='ls --color=always -l   --human-readable'
		alias      llz-color='ls --color=always -lZ  --human-readable'
		alias     llrs-color='ls --color=always -lrS --human-readable'
		alias     llrt-color='ls --color=always -lrt --human-readable'
		alias      llg-color='ls --color=always -l   --group-directories-first --human-readable'
		alias     llgz-color='ls --color=always -lZ  --group-directories-first --human-readable'
		alias    llrsg-color='ls --color=always -lrS --group-directories-first --human-readable'
		alias    llrtg-color='ls --color=always -lrt --group-directories-first --human-readable'
		alias      llx-color='ls --color=always -lX  --group-directories-first --human-readable'
		alias     llxz-color='ls --color=always -lXZ --group-directories-first --human-readable'

		alias      lla-color='ls --color=always -lA   --human-readable'
		alias     llaz-color='ls --color=always -lAZ  --human-readable'
		alias    llars-color='ls --color=always -lArS --human-readable'
		alias    llart-color='ls --color=always -lArt --human-readable'
		alias     llag-color='ls --color=always -lA   --group-directories-first --human-readable'
		alias    llagz-color='ls --color=always -lAZ  --group-directories-first --human-readable'
		alias   llarsg-color='ls --color=always -lArS --group-directories-first --human-readable'
		alias   llartg-color='ls --color=always -lArt --group-directories-first --human-readable'
		alias     llax-color='ls --color=always -lAX  --group-directories-first --human-readable'
		alias    llaxz-color='ls --color=always -lAXZ --group-directories-first --human-readable'
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
		alias           l1a='ls -G -1A'

		alias      l1-color='CLICOLOR_FORCE=1 ls -1'
		alias     l1a-color='CLICOLOR_FORCE=1 ls -1A'

		# ll base
		alias            ll='ls -G -lh'
		alias          ll-B='ls -G -l'
		alias          ll-K='BLOCKSIZE=1024 ls -G -l '
		alias          ll-M='BLOCKSIZE=1048576 ls -G -l '
		alias          ll-G='BLOCKSIZE=1073741824 ls -G -l '

		alias          llrs='ls -G -lhrS'
		alias        llrs-B='ls -G -lrS'
		alias        llrs-K='BLOCKSIZE=1024 ls -G -lrS '
		alias        llrs-M='BLOCKSIZE=1048576 ls -G -lrS '
		alias        llrs-G='BLOCKSIZE=1073741824 ls -G -lrS '

		alias          llrt='ls -G -lhrt'
		alias        llrt-B='ls -G -lrt'
		alias        llrt-K='BLOCKSIZE=1024 ls -G -lrt '
		alias        llrt-M='BLOCKSIZE=1048576 ls -G -lrt '
		alias        llrt-G='BLOCKSIZE=1073741824 ls -G -lrt '

		alias           lla='ls -G -lAh'
		alias         lla-B='ls -G -lA'
		alias         lla-K='BLOCKSIZE=1024 ls -G -lA '
		alias         lla-M='BLOCKSIZE=1048576 ls -G -lA '
		alias         lla-G='BLOCKSIZE=1073741824 ls -G -lA '

		alias         llars='ls -G -lAhrS'
		alias       llars-B='ls -G -lArS'
		alias       llars-K='BLOCKSIZE=1024 ls -G -lArS '
		alias       llars-M='BLOCKSIZE=1048576 ls -G -lArS '
		alias       llars-G='BLOCKSIZE=1073741824 ls -G -lArS '

		alias         llart='ls -G -lAhrt'
		alias       llart-B='ls -G -lArt'
		alias       llart-K='BLOCKSIZE=1024 ls -G -lArt '
		alias       llart-M='BLOCKSIZE=1048576 ls -G -lArt '
		alias       llart-G='BLOCKSIZE=1073741824 ls -G -lArt '

		alias      ll-color='CLICOLOR_FORCE=1 ls -lh'
		alias    ll-B-color='CLICOLOR_FORCE=1 ls -l'
		alias    ll-K-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -l'
		alias    ll-M-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -l'
		alias    ll-G-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -l'

		alias    llrs-color='CLICOLOR_FORCE=1 ls -lhrS'
		alias  llrs-B-color='CLICOLOR_FORCE=1 ls -lrS'
		alias  llrs-K-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lrS'
		alias  llrs-M-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lrS'
		alias  llrs-G-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lrS'

		alias    llrt-color='CLICOLOR_FORCE=1 ls -lhrt'
		alias  llrt-B-color='CLICOLOR_FORCE=1 ls -lrt'
		alias  llrt-K-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lrt'
		alias  llrt-M-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lrt'
		alias  llrt-G-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lrt'

		alias     lla-color='CLICOLOR_FORCE=1 ls -lAh'
		alias   lla-B-color='CLICOLOR_FORCE=1 ls -lA'
		alias   lla-K-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lA'
		alias   lla-M-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lA'
		alias   lla-G-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lA'

		alias   llars-color='CLICOLOR_FORCE=1 ls -lAhrS'
		alias llars-B-color='CLICOLOR_FORCE=1 ls -lArS'
		alias llars-K-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lArS'
		alias llars-M-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lArS'
		alias llars-G-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lArS'

		alias   llart-color='CLICOLOR_FORCE=1 ls -lAhrt'
		alias llart-B-color='CLICOLOR_FORCE=1 ls -lArt'
		alias llart-K-color='CLICOLOR_FORCE=1 BLOCKSIZE=1024 ls -lArt'
		alias llart-M-color='CLICOLOR_FORCE=1 BLOCKSIZE=1048576 ls -lArt'
		alias llart-G-color='CLICOLOR_FORCE=1 BLOCKSIZE=1073741824 ls -lArt'
	fi
fi

# lsblk
if   type -fP 'lsblk' > '/dev/null' 2>&1
then
	alias lsblk-disk='lsblk -dp -o NAME,GROUP,TRAN,VENDOR,MODEL,REV,SERIAL,SIZE,PHY-SEC,LOG-SEC,ZONED,SCHED'
	alias lsblk-part='lsblk  -p -o NAME,PTTYPE,TYPE,SIZE,PARTTYPE,PARTTYPENAME,PARTFLAGS,PARTLABEL,MOUNTPOINTS'
	alias   lsblk-fs='lsblk  -p -o NAME,TYPE,FSTYPE,SIZE,FSSIZE,FSUSED,FSAVAIL,FSUSE%,LABEL,PARTLABEL,MOUNTPOINTS'
fi

# lsd
if   type -fP 'lsd' > '/dev/null' 2>&1
then
	alias    lsda='lsd -A'

	alias    lsdl='lsd -l'
	alias  lsdlrs='lsd -lrS'
	alias  lsdlrt='lsd -lrt'
	alias   lsdlx='lsd -lX'
	alias   lsdla='lsd -lA'
	alias lsdlars='lsd -lArS'
	alias lsdlart='lsd -lArt'
	alias  lsdlax='lsd -lAX'

	alias   lsdt='lsd     -tree'
	alias  lsdat='lsd -A  -tree'
	alias  lsdlt='lsd -l  -tree'
	alias lsdlat='lsd -lA -tree'

	alias     lsd-color='lsd --color=always'
	alias    lsda-color='lsd --color=always -A'

	alias    lsdl-color='lsd --color=always -l'
	alias  lsdlrs-color='lsd --color=always -lrS'
	alias  lsdlrt-color='lsd --color=always -lrt'
	alias   lsdlx-color='lsd --color=always -lX'
	alias   lsdla-color='lsd --color=always -lA'
	alias lsdlars-color='lsd --color=always -lArS'
	alias lsdlart-color='lsd --color=always -lArt'
	alias  lsdlax-color='lsd --color=always -lAX'

	alias   lsdt-color='lsd --color=always     -tree'
	alias  lsdat-color='lsd --color=always -A  -tree'
	alias  lsdlt-color='lsd --color=always -l  -tree'
	alias lsdlat-color='lsd --color=always -lA -tree'

	for (( i=2 ; i < 9 ; i+=1 ))
	do
		alias   "lsdt${i}"="lsd     --tree --depth ${i}"
		alias  "lsdat${i}"="lsd -A  --tree --depth ${i}"
		alias  "lsdlt${i}"="lsd -l  --tree --depth ${i}"
		alias "lsdlat${i}"="lsd -lA --tree --depth ${i}"

		alias   "lsdt${i}-color"="lsd --color=always     --tree --depth ${i}"
		alias  "lsdat${i}-color"="lsd --color=always -A  --tree --depth ${i}"
		alias  "lsdlt${i}-color"="lsd --color=always -l  --tree --depth ${i}"
		alias "lsdlat${i}-color"="lsd --color=always -lA --tree --depth ${i}"
	done
fi

# npm
if   type -fP 'npm' > '/dev/null' 2>&1
then
	alias     npm-list='npm list --global'
	alias npm-outdated='npm outdated --global'
	alias   npm-update='npm update --global'
fi

# onefetch
if   type -fP 'onefetch' > '/dev/null' 2>&1
then
	alias onefetch='onefetch --number-of-languages 8'
fi

# pip
if   type -fP 'pip' > '/dev/null' 2>&1
then
	alias     pip-list='pip list --user'
	alias pip-outdated='pip list --user --outdated'
fi

# pip2
if   type -fP 'pip2' > '/dev/null' 2>&1
then
	alias     pip2-list='pip2 list --user'
	alias pip2-outdated='pip2 list --user --outdated'
fi

# pip3
if   type -fP 'pip3' > '/dev/null' 2>&1
then
	alias     pip3-list='pip3 list --user'
	alias pip3-outdated='pip3 list --user --outdated'
fi

# rg
if   type -fP 'rg' > '/dev/null' 2>&1
then
	alias rg-color='rg --color=always'

	for (( i=1 ; i < 9 ; i+=1 ))
	do
		alias "rg${i}"="rg --context=${i}"
		alias "rg${i}-color"="rg --color=always --context=${i}"
	done
fi

# rpm
if   type -fP 'rpm' > '/dev/null' 2>&1
then
	alias rpm-show='rpm --eval="\
%%{build_cflags}    = %{?build_cflags}
%%{build_cppflags}  = %{?build_cppflags}
%%{build_cxxflags}  = %{?build_cxxflags}
%%{build_fflags}    = %{?build_fflags}
%%{build_fcflags}   = %{?build_fcflags}
%%{build_ldflags}   = %{?build_ldflags}
%%{build_rustflags} = %{?build_rustflags}

%%{_lto_cflags}     = %{?_lto_cflags}

%%make_build        = %{?make_build}
%%make_install      = %{?make_install}
"'
fi

# sed
if   type -fP 'sed' > '/dev/null' 2>&1
then
	alias Esed='sed -E'

	alias cd-file-gitdir=fn_cd_file_gitdir
	alias cd-file-.git=fn_cd_file_.git
fi

# stat
if   type -fP 'stat' > '/dev/null' 2>&1
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
if   type -fP 'tree' > '/dev/null' 2>&1
then
	alias ltree='tree -pugshD'

	alias  tree-color='tree -C'
	alias ltree-color='tree -CpugshD'

	for (( i=2 ; i < 9 ; i+=1 ))
	do
		alias  "tree${i}"="tree -L ${i}"
		alias "ltree${i}"="tree -L ${i} -pugshD"

		alias  "tree${i}-color"="tree -L ${i} -C"
		alias "ltree${i}-color"="tree -L ${i} -CpugshD"
	done
fi

# usbimager
if   type -fP 'usbimager' > '/dev/null' 2>&1
then
	alias usbimager='usbimager -m1024 -7'
fi

# xdpyinfo
if   type -fP 'xdpyinfo' > '/dev/null' 2>&1
then
	if   type -fP 'grep' > '/dev/null' 2>&1
	then
		alias xdpi='xdpyinfo | grep -A 2 "^screen #.*"'
	elif type -fP 'sed' > '/dev/null' 2>&1
	then
		alias xdpi='xdpyinfo | sed -n -e "/^screen #/,+2p"'
	fi
fi

# xmllint
if   type -fP 'xmllint' > '/dev/null' 2>&1
then
	if   [[ -f '/usr/share/YaST2/schema/autoyast/rng/profile.rng' ]]
	then
		alias validate-autoyast='xmllint --noout --relaxng /usr/share/YaST2/schema/autoyast/rng/profile.rng'
	fi

	if   [[ -f '/usr/lib/python3.13/site-packages/kiwi/schema/kiwi.rng' ]]
	then
		alias validate-kiwi='xmllint --noout --relaxng /usr/lib/python3.13/site-packages/kiwi/schema/kiwi.rng'
	fi
fi

# Custom
alias separator='echo; for (( i=0 ; i < ${COLUMNS} ; i+=1 )); do echo -n "="; done; echo; echo'

if   [[ 'Windows_NT' == "${OS}" && 'MINGW64' == "${MSYSTEM}" ]]
then
	[[ -x '/c/Windows/System32/OpenSSH/ssh'  ]] && alias  ssh-win='/c/Windows/System32/OpenSSH/ssh  -o GSSAPIAuthentication=yes'
	[[ -x '/c/Windows/System32/OpenSSH/scp'  ]] && alias  scp-win='/c/Windows/System32/OpenSSH/scp  -o GSSAPIAuthentication=yes'
	[[ -x '/c/Windows/System32/OpenSSH/sftp' ]] && alias sftp-win='/c/Windows/System32/OpenSSH/sftp -o GSSAPIAuthentication=yes'

	[[ -x '/c/Windows/System32/OpenSSH/ssh-add'     ]] && alias     ssh-add-win='/c/Windows/System32/OpenSSH/ssh-add'
	[[ -x '/c/Windows/System32/OpenSSH/ssh-keygen'  ]] && alias  ssh-keygen-win='/c/Windows/System32/OpenSSH/ssh-keygen'
	[[ -x '/c/Windows/System32/OpenSSH/ssh-keyscan' ]] && alias ssh-keyscan-win='/c/Windows/System32/OpenSSH/ssh-keyscan'
fi

;; esac                 # END   Interactive only
