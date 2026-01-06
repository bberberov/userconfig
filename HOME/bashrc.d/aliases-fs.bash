# shellcheck disable=SC2139

# BEGIN BTRFS

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

# END   BTRFS

# BEGIN exFAT

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

# END   exFAT

# BEGIN EXT4

# tune2fs
if   which tune2fs > /dev/null 2>&1
then
	#                                 mount_opts limit: [------8-------+-------+-------|-------+-------+-------+------]
	alias    tune2fs-config-root='tune2fs -E mount_opts=noatime'
	alias    tune2fs-config-boot='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec'
	alias     tune2fs-config-opt='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias     tune2fs-config-usr='tune2fs -E mount_opts=noatime,nodev,commit=20'
	alias     tune2fs-config-var='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias  tune2fs-config-varlib='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias  tune2fs-config-vartmp='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias    tune2fs-config-home='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias     tune2fs-config-srv='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec,commit=20'

	alias tune2fs-config-storage='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec'
fi

# END   EXT4

# BEGIN F2FS

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

# mount.f2fs
if   ! which mount.f2fs > /dev/null 2>&1
then
	alias mount.f2fs='mount -t f2fs \
	-o \
atgc,\
compress_algorithm=zstd:6,\
compress_extension=txt,\
compress_chksum
'
fi

# END   F2FS

# BEGIN FAT

# mkfs.fat
if   which mkfs.fat > /dev/null 2>&1
then
	which mkfs.fat12 > /dev/null 2>&1 || alias mkfs.fat12='mkfs.fat -F 12'
	which mkfs.fat16 > /dev/null 2>&1 || alias mkfs.fat16='mkfs.fat -F 16'
	alias mkfs.fat16-af='mkfs.fat -F 16 -S 4096'
	which mkfs.fat32 > /dev/null 2>&1 || alias mkfs.fat32='mkfs.fat -F 32'
	alias mkfs.fat32-af='mkfs.fat -F 32 -S 4096'
fi

# END   FAT

# mount
if   which mount > /dev/null 2>&1
then
	alias mount-manual='mount -o noatime'
	alias mount-examine='mount -o ro,noatime,nodev,nosuid,noexec'
	alias mount-storage='mount -o noatime,nodev,nosuid,noexec'
fi
