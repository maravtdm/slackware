#!/bin/sh

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

# Built kernel
cd linux
zcat /proc/config.gz > .config
make olddefconfig
make -j4 all
# make the compiled kernel bootable
cat arch/x86/boot/bzImage > /boot/vmlinuz-stable
# install modules
make -j4 modules_install
# make initrd
mkinitrd -F -c -k ${VERSION} 
# update lilo
lilo -v
