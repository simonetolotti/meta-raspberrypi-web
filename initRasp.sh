#!/bin/bash 
cd ..
#$SHELL
echo "Custom Init Enviroment for Yocto and Raspberry PI 4"
source oe-init-build-env
# If conf/local.conf is not generated, no need to go further
if [ ! -e conf/local.conf ]; then
    echo "Error" && exit 1
fi
echo ""
echo "Get the custom configuration"
echo ""
cd ..
\cp meta-raspberrypi-web/initRasp/local.conf.sample build/conf/
\cp meta-raspberrypi-web/initRasp/bblayers.conf.sample build/conf/

if [ -e build/conf/local.conf.sample ]; then
   \mv build/conf/local.conf.sample build/conf/local.conf
fi
if [ -e build/conf/bblayers.conf.sample ]; then
   \mv build/conf/bblayers.conf.sample build/conf/bblayers.conf
fi
\cat <<EOF
Welcome to PI4 - Web Server
You can now run:
	bitbake rpi-basic-image
	bitbake core-image-base

Common targets are:
`echo; ls meta-raspberrypi/conf/machine/*.conf \
| sed s/\.conf//g | sed -r 's/^.+\///' | xargs -I% echo -e "\t%";`
EOF
cd build/
$SHELL
