#!/bin/bash
# git clone https://github.com/mkubecek/vmware-host-modules.git
#    44  sudo apt install git
#    45  git clone https://github.com/mkubecek/vmware-host-modules.git
#    46  ls
#    47  cd vmware-host-modules/
#    48  ls
#    49  git checkout workstation-15.1.0
#    50  ls
#    51  sudo make && sudo make install
#    52  cd /usr/lib/vmware/lib/libz.so.1
#    53  sudo mv libz.so.1 libz.so.1.old
#    54  sudo ln -s /lib/x86_64-linux-gnu/libz.so.1
#    55  sudo depmod -a
#    56  sudo /etc/init.d/vmware restart

#Version check
#clone
git clone https://github.com/mkubecek/vmware-host-modules.git
cd vmware-host-modules/
#awk  '{print $1}'
# VMVERSION = vmware -v | awk  '{print $3}'
#echo vmware-$(vmware -v | awk  '{print $3}')
git checkout workstation-$(vmware -v | awk  '{print $3}')
sudo make && sudo make install
cd /usr/lib/vmware/lib/libz.so.1
sudo mv libz.so.1 libz.so.1.old
sudo ln -s /lib/x86_64-linux-gnu/libz.so.1
sudo depmod -a
sudo /etc/init.d/vmware restart