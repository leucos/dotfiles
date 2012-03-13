if `which keychain`; then
  export SSH_ASKPASS=/usr/bin/x11-ssh-askpass
  eval `keychain --eval --agents ssh --nogui -Q -q id_dsa`
ffi
i
