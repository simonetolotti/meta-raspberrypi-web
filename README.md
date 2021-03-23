# Nginx and NodeJS support

### Video 

This project was presented during the "IoT Saturday 2020" at Consorzio Universitario di Pordenone. (The 2020 edition was only online due to COVID-19 restrictions)
https://www.youtube.com/watch?v=8CtLd19rwq4

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
git checkout tags/yocto-3.1.3 -b my-yocto-3.1.3
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
git switch dunfell
(Verify with «git branch»)
cd ..
```

### Get this...

```
git clone https://github.com/simonetolotti/meta-raspberrypi-web.git
```

### Init enviroment 

```
cd meta-raspberrypi-web
./initRasp.sh
```

### Bitbake

```
bitbake core-image-base
```


