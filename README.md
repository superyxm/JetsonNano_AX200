# JetsonNano_AX200

btusb.zip was built by NormanPai, see https://forums.developer.nvidia.com/t/installing-intel-ax200ngw-bluetooth/115362/7
This file aims to make bluetooth available on Jetson Nano with AX200.

Fitst, back up the file  /lib/modules/4.9.140-tegra/kernel/drivers/bluetooth/btusb.ko

Then replace this file in /lib/modules/4.9.140-tegra/kernel/drivers/bluetooth/btusb.ko.