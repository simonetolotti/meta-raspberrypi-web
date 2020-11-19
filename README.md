# meta-raspberrypi-web

## Prerequisities for Ubuntu 20.04 LTS

sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm

## Get Poky (from Yocto Project)

git clone git://git.yoctoproject.org/poky
cd poky
git checkout tags/yocto-3.1.3 -b my-yocto-3.1.3
(Verify with «git branch»)

## Get Meta Raspberry

git clone git://git.yoctoproject.org/meta-raspberrypi
cd meta-raspberrypi
git switch dunfell
(Verify with «git branch»)
cd ..

## Get Meta Openembedded

git clone git://git.openembedded.org/meta-openembedded
cd meta-openembedded
git switch dunfell
cd ..

## Get this...

git clone https://github.com/simonetolotti/meta-raspberrypi-web.git
cd meta-raspberrypi-web

## Init enviroment 

cd meta-raspberrypi-web
./initRasp.sh

## Bitbake

bitbake rpi-basic-image



