# shellcheck disable=SC2139

# BEGIN BTRFS

# mkfs.btrfs
if   type -fP 'mkfs.btrfs' > '/dev/null' 2>&1
then
	alias mkfs.btrfs-config_single='mkfs.btrfs \
--data single \
--metadata single \
'
	alias mkfs.btrfs-config_dup='mkfs.btrfs \
--data dup \
--metadata dup \
'
	alias mkfs.btrfs-config_storage='mkfs.btrfs \
--data single \
--metadata single \
--nodesize 64K \
'
	alias mkfs.btrfs-config_archive-dup='mkfs.btrfs \
--data dup \
--metadata dup \
--nodesize 64K \
'

	alias mkfs.btrfs-list-all='mkfs.btrfs -O list-all'
elif [[ -f '/usr/sbin/mkfs.btrfs' ]]
then
	alias mkfs.btrfs-list-all='/usr/sbin/mkfs.btrfs -O list-all'
fi

# END   BTRFS

# BEGIN exFAT

# mkfs.exfat
if   type -fP 'mkfs.exfat' > '/dev/null' 2>&1
then
	alias   mkfs.exfat-config_sd-8MiB='mkfs.exfat -b  8K -c   8K'
	alias  mkfs.exfat-config_sd-64MiB='mkfs.exfat -b 16K -c  16K'
	alias mkfs.exfat-config_sd-256MiB='mkfs.exfat -b 32K -c  16K'
	alias   mkfs.exfat-config_sd-1GiB='mkfs.exfat -b 64K -c  16K'
	alias   mkfs.exfat-config_sd-2GiB='mkfs.exfat -b 64K -c  32K'
	alias  mkfs.exfat-config_sd-32GiB='mkfs.exfat -b  4M -c  32K'
	alias mkfs.exfat-config_sd-128GiB='mkfs.exfat -b 16M -c 128K'
	alias mkfs.exfat-config_sd-512GiB='mkfs.exfat -b 32M -c 256K'
	alias   mkfs.exfat-config_sd-2TiB='mkfs.exfat -b 64M -c 512K'
fi

# END   exFAT

# BEGIN EXT4

# tune2fs
if   type -fP 'tune2fs' > '/dev/null' 2>&1
then
	#                                 mount_opts limit: [------8-------+-------+-------|-------+-------+-------+------]
	alias    tune2fs-config_root='tune2fs -E mount_opts=noatime'
	alias    tune2fs-config_boot='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec'
	alias     tune2fs-config_opt='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias     tune2fs-config_usr='tune2fs -E mount_opts=noatime,nodev,commit=20'
	alias     tune2fs-config_var='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias  tune2fs-config_varlib='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias  tune2fs-config_vartmp='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias    tune2fs-config_home='tune2fs -E mount_opts=noatime,nodev,nosuid,commit=20'
	alias     tune2fs-config_srv='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec,commit=20'

	alias tune2fs-config_storage='tune2fs -E mount_opts=noatime,nodev,nosuid,noexec'
fi

# END   EXT4

# BEGIN F2FS

# mkfs.f2fs
if   type -fP 'mkfs.f2fs' > '/dev/null' 2>&1
then
	alias mkfs.f2fs-config_default='mkfs.btrfs \
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
if   ! type -fP 'mount.f2fs' > '/dev/null' 2>&1
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
if   type -fP 'mkfs.fat' > '/dev/null' 2>&1
then
	if   type -fP 'mkfs.fat12' > '/dev/null' 2>&1
	then
		alias mkfs.fat12='mkfs.fat -F 12'
	fi

	if   type -fP 'mkfs.fat16' > '/dev/null' 2>&1
	then
		alias mkfs.fat16='mkfs.fat -F 16'

		alias     mkfs.fat16-config_sf='mkfs.fat -F 16 -S 512'
		alias mkfs.fat16-config_sf-512='mkfs.fat -F 16 -S 512 -s 1'
		alias  mkfs.fat16-config_sf-1k='mkfs.fat -F 16 -S 512 -s 2'
		alias  mkfs.fat16-config_sf-2k='mkfs.fat -F 16 -S 512 -s 4'
		alias  mkfs.fat16-config_sf-4k='mkfs.fat -F 16 -S 512 -s 8'
		alias  mkfs.fat16-config_sf-8k='mkfs.fat -F 16 -S 512 -s 16'
		alias mkfs.fat16-config_sf-16k='mkfs.fat -F 16 -S 512 -s 32'
		alias mkfs.fat16-config_sf-32k='mkfs.fat -F 16 -S 512 -s 64'
		alias mkfs.fat16-config_sf-64k='mkfs.fat -F 16 -S 512 -s 128'

		alias      mkfs.fat16-config_af='mkfs.fat -F 16 -S 4096'
		alias   mkfs.fat16-config_af-4k='mkfs.fat -F 16 -S 4096 -s 1'
		alias   mkfs.fat16-config_af-8k='mkfs.fat -F 16 -S 4096 -s 2'
		alias  mkfs.fat16-config_af-16k='mkfs.fat -F 16 -S 4096 -s 4'
		alias  mkfs.fat16-config_af-32k='mkfs.fat -F 16 -S 4096 -s 8'
		alias  mkfs.fat16-config_af-64k='mkfs.fat -F 16 -S 4096 -s 16'
		alias mkfs.fat16-config_af-128k='mkfs.fat -F 16 -S 4096 -s 32'
		alias mkfs.fat16-config_af-256k='mkfs.fat -F 16 -S 4096 -s 64'
		alias mkfs.fat16-config_af-512k='mkfs.fat -F 16 -S 4096 -s 128'
	fi

	if   type -fP 'mkfs.fat32' > '/dev/null' 2>&1
	then
		alias mkfs.fat32='mkfs.fat -F 32'

		alias     mkfs.fat32-config_sf='mkfs.fat -F 32 -S 512'
		alias mkfs.fat32-config_sf-512='mkfs.fat -F 32 -S 512 -s 1'
		alias  mkfs.fat32-config_sf-1k='mkfs.fat -F 32 -S 512 -s 2'
		alias  mkfs.fat32-config_sf-2k='mkfs.fat -F 32 -S 512 -s 4'
		alias  mkfs.fat32-config_sf-4k='mkfs.fat -F 32 -S 512 -s 8'
		alias  mkfs.fat32-config_sf-8k='mkfs.fat -F 32 -S 512 -s 16'
		alias mkfs.fat32-config_sf-16k='mkfs.fat -F 32 -S 512 -s 32'
		alias mkfs.fat32-config_sf-32k='mkfs.fat -F 32 -S 512 -s 64'
		alias mkfs.fat32-config_sf-64k='mkfs.fat -F 32 -S 512 -s 128'

		alias      mkfs.fat32-config_af='mkfs.fat -F 32 -S 4096'
		alias   mkfs.fat32-config_af-4k='mkfs.fat -F 32 -S 4096 -s 1'
		alias   mkfs.fat32-config_af-8k='mkfs.fat -F 32 -S 4096 -s 2'
		alias  mkfs.fat32-config_af-16k='mkfs.fat -F 32 -S 4096 -s 4'
		alias  mkfs.fat32-config_af-32k='mkfs.fat -F 32 -S 4096 -s 8'
		alias  mkfs.fat32-config_af-64k='mkfs.fat -F 32 -S 4096 -s 16'
		alias mkfs.fat32-config_af-128k='mkfs.fat -F 32 -S 4096 -s 32'
		alias mkfs.fat32-config_af-256k='mkfs.fat -F 32 -S 4096 -s 64'
		alias mkfs.fat32-config_af-512k='mkfs.fat -F 32 -S 4096 -s 128'
	fi
fi

# END   FAT

# mount
if   type -fP 'mount' > '/dev/null' 2>&1
then
	alias mount-manual='mount -o noatime'
	alias mount-examine='mount -o ro,noatime,nodev,nosuid,noexec'
	alias mount-storage='mount -o noatime,nodev,nosuid,noexec'
fi
