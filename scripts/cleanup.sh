#!/bin/sh -x

# Clean up DHCP leases
echo "Cleaning up dhcp leases..."
rm /var/lib/dhcp/*

#Remove oh-my-zsh git repo histories to save space; keep the current code checkout. We want oh-my-zsh but not the whole git repo's history
echo "Removing oh-my-zsh git repos..."
rm -rf /home/vagrant/.oh-my-zsh/.git
rm -rf /root/.oh-my-zsh/.git

#Remove rbenv git repo histories to save space; keep the current code checkout. We want rbenv but not the whole git repo's history
echo "Removing rbenv git repos..."
rm -rf /home/vagrant/.rbenv/.git
rm -rf /root/.rbenv/.git

#apt cleanup
#echo "Running apt-get remove kernel headers..."
#apt-get -y remove linux-headers-$(uname -r)
#echo "Running remove older kernel headers"
#dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
# Clean up unnecessary packages
echo "Removing unnecessary packages..."
apt-get -y purge libx11-data xauth libxcb1 libx11-6 libxext6
apt-get -y purge ppp pppconfig pppoeconf popularity-contest
echo "Running apt-get clean..."
apt-get -y clean
echo "Running apt-get autoclean..."
apt-get -y autoclean
echo "Running apt-get remove..."
apt-get -y remove
echo "Running apt-get auto-remove..."
apt-get -y autoremove

#Remove non-English locale files
echo "Removing non-English locale files"
mv /usr/share/locale/en /tmp
rm -rf /usr/share/locale/*
mv /tmp/en /usr/share/locale

echo "pre-up sleep 2" >> /etc/network/interfaces

#zero out disk space. Replacing free space with 0s makes the drive more easily compressed
echo "Zeroing out disk..."
cat /dev/zero > zero.fill;sync;sleep 1;sync;rm -f zero.fill

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
exit
