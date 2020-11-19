IMAGE_INSTALL_append = " \
  openssl \   
  nginx \   
  nodejs \
"

inherit extrausers
 
EXTRA_USERS_PARAMS = "usermod -P r root;"
