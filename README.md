# Nginx, NodeJS and TPM2 from ST Microeletronics (ST33)

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

## Note about Device Tree Source and Kernel Options

### Patch DTS / DTB

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

## How to test TPM

### TPM tools (tpm2-tools)

Try the following commands:

```
tpm2_getrandom 8 | xxd -p
tpm2_getrandom 16 | xxd -p
tpm2_getrandom 32 | xxd -p
tpm2_getrandom 48 | xxd -p
```

### Generate Key (tpm2-tss)

```
tpm2tss-genkey -a rsa private.tss
cat private.tss
```

result:

```
-----BEGIN TSS2 PRIVATE KEY-----
MIICDwYGZ4EFCgEDoAMBAQECAQAEggEYARYAAQALAAYEcgAAABAAEAgAAAEAAQEA
...
5Xh9wLLdEzh0NoxGACGuGGiSAB/g2qHAdXQ9vofhMfYxoxFL7du9xBR7VwknuJIz
bnfJ
-----END TSS2 PRIVATE KEY-----
```

### TSS Engine (tpm2-tss-engine)

Engine informations can be retrieved using

```
openssl engine -t -c tpm2tss
```

A set of 10 or 16 random bytes can be retrieved using

```
openssl rand -engine tpm2tss -hex 10
openssl rand -engine tpm2tss -hex 16
```

#### RSA 2048

```
tpm2tss-genkey -a rsa -s 2048 mykey
openssl rsa -engine tpm2tss -inform engine -in mykey -pubout -outform pem -out mykey.pub
```

#### EDCSA

```
tpm2tss-genkey -a ecdsa mykey
openssl ec -engine tpm2tss -inform engine -in mykey -pubout -outform pem -out mykey.pub
```

#### Self Signed

```
tpm2tss-genkey -a rsa rsa.tss
openssl req -new -x509 -engine tpm2tss -key rsa.tss -keyform engine -out rsa.crt
```








