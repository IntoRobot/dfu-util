#!/bin/bash
# Author: Mark Chen<>
cd ../
make
cd src
stty -F /dev/cu.usbmodem1411 19200
sleep 2
./dfu-util -d 0x0483:0xdf11 -a 0 -R -s 0x08020000:leave -D default-neutron.dfu
