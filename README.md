# meta-raspberrypi-web with NodeJS and Dotnet

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
cd
cd meta-openembedded
git switch dunfell-next
(Verify with «git branch»)
cd ..
```
### Get Meta Security

```
git clone git://git.yoctoproject.org/meta-security
cd meta-raspberrypi
git switch dunfell-next
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
git switch dotnet
./initRasp.sh
```

### Bitbake

```
bitbake core-image-base
```


