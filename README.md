# Nginx, NodeJS and Dotnet

### Hardware Prerequisites

Use the following Raspbeyy Pi 4 rev. B with 4GB RAM

https://www.raspberrypi.org/products/raspberry-pi-4-model-b/


### Prerequisities for Ubuntu 20.04 LTS

```
sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm
```

### Get Poky (from Yocto Project)

```
git clone git://git.yoctoproject.org/poky
cd poky
git switch dunfell-next
(Verify with «git branch»)
```

### Get Meta Raspberry

```
git clone git://git.yoctoproject.org/meta-raspberrypi
cd meta-raspberrypi
git switch dunfell
(Verify with «git branch»)
cd ..
```

### Get Meta Openembedded

```
git clone git://git.openembedded.org/meta-openembedded
cd meta-openembedded
git switch dunfell-next
(Verify with «git branch»)
cd ..
```
### Get Meta Security

```
git clone git://git.yoctoproject.org/meta-security
cd meta-security
git switch dunfell-next
(Verify with «git branch»)
cd ..
```

### Change lttng

Replace entire folder on meta/recipes-kernel/lttng from the master branch.
So, lttng-modules will move from 2.11.6 to 2.12.3 version

### Get these...

```
git clone https://github.com/simonetolotti/meta-raspberrypi-web.git
git clone https://github.com/simonetolotti/meta-dotnet-core.git
```

### Init enviroment 

```
cd meta-raspberrypi-web
git switch dotnet
./initRasp.sh
```

### Bitbake

```
bitbake core-image-base
```


