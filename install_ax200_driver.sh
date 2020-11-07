#!/bin/bash

#Install the iwlwifi drivers
git clone --single-branch --branch release/core45 https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git
cd backport-iwlwifi/
make defconfig-iwlwifi-public
sed -i 's/CPTCFG_IWLMVM_VENDOR_CMDS=y/# CPTCFG_IWLMVM_VENDOR_CMDS is not set/' .config
make -j4
sudo make install

# Install the Intel 802.11ax drivers for linux
git clone https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git --branch iwlwifi-fw-2019-07-20 --single-branch
cd linux-firmware/
sudo cp iwlwifi-cc-a0-48.ucode /lib/firmware 

# Install Wireshark (development version)
sudo add-apt-repository ppa:wireshark-dev/stable
sudo add-apt-repository ppa:dreibh/ppa
sudo apt update
sudo apt -y install wireshark
sudo apt -y install wireshark-qt

#Install aircrack-ng
sudo apt -y install aircrack-ng

# Install tcmpdump
sudo apt -y install tcpdump

#/ Allow the user to be able to use tcmpdump over an SSH connection (remote connection)
sudo groupadd pcap
sudo usermod -a -G pcap $USER
sudo chgrp pcap /usr/sbin/tcpdump
sudo chmod 750 /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump