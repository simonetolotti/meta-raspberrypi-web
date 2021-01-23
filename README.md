# meta-raspberrypi-web with NodeJS and SPI TPM2

### Hardware Prerequisites 

Use the following Raspbeyy PI 4 rev. B with 4GB RAM

https://www.raspberrypi.org/products/raspberry-pi-4-model-b/

Please install the following board from ST Microeletronics on Raspberry

https://www.st.com/resource/en/data_brief/stpm4raspi.pdf

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

### Get Meta Security

```
git clone git://git.yoctoproject.org/meta-security
cd meta-security
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

## Note about DTB and Kernel Options

### Patch DTB

Download Linux Kernel for Raspberry

```
git clone https://github.com/raspberrypi/linux.git
```

go to the same branch name as Kernel used on this recipe (rpi-5.4.y should be the default branch)

go to go to arch/arm/boot/dts and modify the file bcm2711-rpi-4-b.dts with the followings:

```
spidev0: spidev@0{
		compatible = "spidev";
		reg = <0>;	/* CE0 */
		#address-cells = <1>;
		#size-cells = <0>;
		spi-max-frequency = <125000000>;
};
```

replaced by

```
st33htpm0: st33htpm@0{
  	status="okay";
    compatible = "st,st33htpm-spi";
 		reg = <0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
		spi-max-frequency = <10000000>;
};
```

And create the patch with 

```
git diff > tpm2_spi0_st33.patch
```

So, call it on recipes-kernel append recipe

### Kernel Options

Enable the following 

```
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_SPI=y
CONFIG_TCG_TIS_ST33ZP24_SPI=y
# CONFIG_SECURITYFS is not set
```






