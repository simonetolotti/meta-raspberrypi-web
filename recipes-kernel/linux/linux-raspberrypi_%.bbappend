FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://tpm2_spi0_st33.patch \
    "

SRC_URI += "file://tpm2_spi0_st33_9670.cfg \
            file://tpm-slb9670-overlay.dts;subdir=git/arch/arm/boot/dts/overlays \
            "

PACKAGE_ARCH = "${MACHINE_ARCH}"
KERNEL_DEVICETREE += "overlays/tpm-slb9670.dtbo"
