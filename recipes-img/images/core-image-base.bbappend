IMAGE_FEATURES_remove += "splash"

IMAGE_INSTALL_append = " \
  nano \
  openssl \   
  nginx \
  nodejs \
  tpm2-tools \
  libtss2 \
  libtss2-tcti-device \
  libtss2-tcti-mssim \
  tpm2-abrmd \
  tpm2-pkcs11 \
  tpm2-totp \
  tpm2-tss \
  tpm2-tss-engine \
  tpm2-tss-engine-dev \ 
  vim \
  syslog-ng \
"
KERNEL_DEVICETREE =+ "overlays/tpm-slb9670.dtbo"

IMAGE_FEATURES += "ssh-server-openssh"

inherit extrausers
 
EXTRA_USERS_PARAMS = "usermod -P r root;"
