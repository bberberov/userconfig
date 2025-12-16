# shellcheck disable=SC2139

# bat
if   which bat > /dev/null 2>&1
then
	alias bat-color='bat --color always --terminal-width ${COLUMNS}'
fi

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

alias cd-sudo-home='cd "${SUDO_HOME:-${HOME}}"'

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

# diff
if   which diff > /dev/null 2>&1
then
	alias         diff='diff --color=auto'
	alias       diff-y='diff --color=auto -y'
	alias   diff-color='diff --color=always'
	alias diff-y-color='diff --color=always -y'
fi

# difft
if   which difft > /dev/null 2>&1
then
	alias difft-y='difft --display side-by-side'
	alias   difft-color='difft --color always --width ${COLUMNS}'
	alias difft-y-color='difft --color always --width ${COLUMNS} --display side-by-side'
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

# jq
if   which jq > /dev/null 2>&1
then
	alias jq-color='jq --color-output'
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
		alias             ll='ls --color=auto -l --human-readable'
		alias           llrs='ls --color=auto -lrS --human-readable'
		alias           llrt='ls --color=auto -lrt --human-readable'
		alias            llg='ls --color=auto -l --group-directories-first --human-readable'
		alias          llrsg='ls --color=auto -lrS --group-directories-first --human-readable'
		alias          llrtg='ls --color=auto -lrt --group-directories-first --human-readable'
		alias            llx='ls --color=auto -lX --group-directories-first --human-readable'

		alias            lla='ls --color=auto -lA --human-readable'
		alias          llars='ls --color=auto -lArS --human-readable'
		alias          llart='ls --color=auto -lArt --human-readable'
		alias           llag='ls --color=auto -lA --group-directories-first --human-readable'
		alias         llarsg='ls --color=auto -lArS --group-directories-first --human-readable'
		alias         llartg='ls --color=auto -lArt --group-directories-first --human-readable'
		alias           llax='ls --color=auto -lAX --group-directories-first --human-readable'

		alias       ll-color='ls --color=always -l --human-readable'
		alias     llrs-color='ls --color=always -lrS --human-readable'
		alias     llrt-color='ls --color=always -lrt --human-readable'
		alias      llg-color='ls --color=always -l --group-directories-first --human-readable'
		alias    llrsg-color='ls --color=always -lrS --group-directories-first --human-readable'
		alias    llrsg-color='ls --color=always -lrt --group-directories-first --human-readable'
		alias      llx-color='ls --color=always -lX --group-directories-first --human-readable'

		alias      lla-color='ls --color=always -lA --human-readable'
		alias    llars-color='ls --color=always -lArS --human-readable'
		alias    llart-color='ls --color=always -lArt --human-readable'
		alias     llag-color='ls --color=always -lA --group-directories-first --human-readable'
		alias   llarsg-color='ls --color=always -lArS --group-directories-first --human-readable'
		alias   llartg-color='ls --color=always -lArt --group-directories-first --human-readable'
		alias     llax-color='ls --color=always -lAX --group-directories-first --human-readable'
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
if   which lsblk > /dev/null 2>&1
then
	alias lsblk-disk='lsblk -dp -o NAME,GROUP,TRAN,VENDOR,MODEL,REV,SERIAL,SIZE,PHY-SEC,LOG-SEC,ZONED,SCHED'
	alias lsblk-part='lsblk  -p -o NAME,PTTYPE,TYPE,SIZE,PARTTYPE,PARTTYPENAME,PARTFLAGS,PARTLABEL,MOUNTPOINTS'
	alias   lsblk-fs='lsblk  -p -o NAME,TYPE,FSTYPE,SIZE,FSSIZE,FSUSED,FSAVAIL,FSUSE%,LABEL,PARTLABEL,MOUNTPOINTS'
fi

# lsd
if   which lsd > /dev/null 2>&1
then
	alias    lsda='lsd -A'

	alias    lsdl='lsd -l'
	alias  lsdlrs='lsd -lrS'
	alias  lsdlrt='lsd -lrt'
	alias   lsdlx='lsd -lX'
	alias   lsdla='lsd -l'
	alias lsdlars='lsd -lArS'
	alias lsdlart='lsd -lArt'
	alias  lsdlax='lsd -lAX'

	alias   lsdt='lsd     -tree'
	alias  lsdta='lsd -A  -tree'
	alias  lsdlt='lsd -l  -tree'
	alias lsdlta='lsd -lA -tree'

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
	alias  lsdta-color='lsd --color=always -A  -tree'
	alias  lsdlt-color='lsd --color=always -l  -tree'
	alias lsdlta-color='lsd --color=always -lA -tree'

	for (( i=2; i < 9; i+=1 ))
	do
		alias   "lsdt${i}"="lsd     --tree --depth ${i}"
		alias  "lsdta${i}"="lsd -A  --tree --depth ${i}"
		alias  "lsdlt${i}"="lsd -l  --tree --depth ${i}"
		alias "lsdlta${i}"="lsd -lA --tree --depth ${i}"

		alias   "lsdt${i}-color"="lsd --color=always     --tree --depth ${i}"
		alias  "lsdta${i}-color"="lsd --color=always -A  --tree --depth ${i}"
		alias  "lsdlt${i}-color"="lsd --color=always -l  --tree --depth ${i}"
		alias "lsdlta${i}-color"="lsd --color=always -lA --tree --depth ${i}"
	done
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

	alias  rg-autoconf="rg -g '*.ac'"
	alias  rg-automake="rg -g '*.am'"
	alias rg-autotools="rg -g '*.ac' -g '*.am' -g '*.m4'"
	alias     rg-cmake="rg -g 'CMakeLists.txt' -g '*.cmake'"
	alias      rg-make="rg -g 'GNUmakefile' -g 'makefile' -g 'Makefile'"
	alias      rg-spec="rg -g '*.spec'"
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

	for (( i=2 ; i < 9 ; i+=1 ))
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

# usbimager
if   which usbimager > /dev/null 2>&1
then
	alias usbimager='usbimager -m1024 -7'
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

# xmllint
if   which xmllint > /dev/null 2>&1
then
	if   [[ -f '/usr/share/YaST2/schema/autoyast/rng/profile.rng' ]]
	then
		alias validate-autoyast='xmllint --noout --relaxng /usr/share/YaST2/schema/autoyast/rng/profile.rng'
	fi
fi

# Custom
alias separator='echo; for (( i=0 ; i < ${COLUMNS} ; i+=1 )); do echo -n "="; done; echo; echo'

[ -x /c/Windows/System32/OpenSSH/ssh ]  && alias  ssh-win='/c/Windows/System32/OpenSSH/ssh  -o GSSAPIAuthentication=yes'
[ -x /c/Windows/System32/OpenSSH/scp ]  && alias  scp-win='/c/Windows/System32/OpenSSH/scp  -o GSSAPIAuthentication=yes'
[ -x /c/Windows/System32/OpenSSH/sftp ] && alias sftp-win='/c/Windows/System32/OpenSSH/sftp -o GSSAPIAuthentication=yes'
[ -x /c/Windows/System32/OpenSSH/ssh-add ]     && alias     ssh-add-win='/c/Windows/System32/OpenSSH/ssh-add'
[ -x /c/Windows/System32/OpenSSH/ssh-keygen ]  && alias  ssh-keygen-win='/c/Windows/System32/OpenSSH/ssh-keygen'
[ -x /c/Windows/System32/OpenSSH/ssh-keyscan ] && alias ssh-keyscan-win='/c/Windows/System32/OpenSSH/ssh-keyscan'
