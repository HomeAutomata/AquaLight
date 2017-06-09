#! /bin/bash

apt update
apt upgrade

apt install build-essentials python3 python3-pip rpi.gpio python-smbus i2c-tools requests scons swig
(
 git clone https://github.com/jgarff/rpi_ws281x.git
 cd rpi_ws281x
 scons

 cd python
 python3 setup.py install
)

cp 01-light.service /lib/systemd/system/

systemctl enable 01-light
systemctl start 01-light
