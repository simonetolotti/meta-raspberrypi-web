IMAGE_INSTALL_append = " \
  openssl \   
  nginx \   
  nodejs \
"

IMAGE_FEATURES += "ssh-server-openssh"

inherit extrausers
 
EXTRA_USERS_PARAMS = "usermod -P r root;"
