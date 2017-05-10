#!/bin/bash
# Author: Mark Chen<>
cd ../
make
cd src
sysType=`uname -s`
if [ $sysType = "Linux" ]; then
  sudo stty -F /dev/ttyACM0 19200
elif [ $sysType = "Darwin" ]; then
  stty -F /dev/cu.usbmodem1411 19200
fi

sleep 2
sudo ./dfu-util -d 0x0483:0xdf11 -a 0 -R -s 0x08020000:leave -D default-neutron.dfu
