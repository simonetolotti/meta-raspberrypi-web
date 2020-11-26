DESCRIPTION = "Configuration files"
LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "\
    file://default_server \
"

do_install_append() {
       install -m 0600 ${WORKDIR}/default_server ${D}${sysconfdir}/nginx/sites-available/default_server
}
