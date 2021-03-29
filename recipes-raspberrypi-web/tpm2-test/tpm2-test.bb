DESCRIPTION = "Test 4 TPM2"
SECTION = "Apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd

RDEPENDS_${PN} += "bash nss"

FILESEXTRAPATHS_prepend := "${THISDIR}/Service_1.0.0:"

SRC_URI += "\
    file://runTest1.sh \     
"

S = "${WORKDIR}/tpm2-test"

do_install() {
    install -d ${D}${sysconfdir}/tpm2-test
    
    # Script
    install -m 0755 ${WORKDIR}/runTest1.sh ${D}${sysconfdir}/tpm2-test/runTest1.sh
    
}

FILES_${PN} += "/tpm2-test"
