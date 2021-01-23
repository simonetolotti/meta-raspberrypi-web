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
"
#KERNEL_DEVICETREE =+ "overlays/letstrust-tpm.dtbo"

IMAGE_FEATURES += "ssh-server-openssh"

inherit extrausers
 
EXTRA_USERS_PARAMS = "usermod -P r root;"
