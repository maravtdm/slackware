#!/bin/sh
### Download & compile latest stable kernel
### in /usr/local/src
### Bootloader : lilo
###
### /etclilo.conf entry :
### image = /boot/vmlinuz-stable
###   initrd = /boot/initrd.gz-stable
###   root = /dev/sda1
###   label = "Latest stable"
###   read-only

SRC="/usr/local/src"
cd $SRC

curl https://www.kernel.org > kernel.out
VERSION=$(grep -n2 "stable:" kernel.out | grep strong | cut -d">" -f3 | cut -d"<" -f1)

if [[ ! -f linux-${VERSION}.tar.xz ]]; then
  wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${VERSION}.tar.xz
fi
if [[ ! -f linux-${VERSION} ]]; then
  tar xvf linux-${VERSION}.tar.xz
fi
if [[ -L linux ]]; then 
  unlink linux
fi
ln -s linux-${VERSION} linux

cd linux
# Fetch the current config
zcat /proc/config.gz > .config
make olddefconfig
# Built kernel
make -j4 all
# install modules
make -j4 modules_install
# make the compiled kernel bootable
cat arch/x86/boot/bzImage > /boot/vmlinuz-stable

### make initrd, you need to customize /etc/mkinitrd.conf
###
### /etc/mkinitrd.conf
### SOURCE_TREE="/boot/initrd-tree"
### CLEAR_TREE="1"
### OUTPUT_IMAGE="/boot/initrd.gz-stable" 
### MODULE_LIST="ext4:zram"    #adapt module list to match your needs
### ROOTDEV="/dev/sda1"
### ROOTFS="ext4"
### UDEV="1"
### WAIT="1"

mkinitrd -F -c -k ${VERSION} 
# update lilo
lilo -v
