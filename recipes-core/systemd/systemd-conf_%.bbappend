SUMMARY = "Systemd configuration"
DESCRIPTION = "fix IP - 10-ipaddr is mandatory"
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://10-ipaddr.network \
    file://en.network \
    file://wlan.network \
"

FILES_${PN} += " \
    ${sysconfdir}/systemd/network/10-ipaddr.network \
    ${sysconfdir}/systemd/network/en.network \
    ${sysconfdir}/systemd/network/wlan.network \
"

do_install_append() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/10-ipaddr.network ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/en.network ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/wlan.network ${D}${sysconfdir}/systemd/network
}

