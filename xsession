
DEFAULT_SESSION=twm

## test for an existing bus daemon, just to be safe
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
## if not found, launch a new one
  eval `dbus-launch --sh-syntax --exit-with-session`
  echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
fi

case $1 in
gnome*)
  exec ck-launch-session dbus-launch gnome-session
  ;;
i3)
#  ls -la /home/leucos/.rvm/bin/ruby > /home/leucos/what
#  which ruby >> /home/leucos/what
#  ~/.rvm/scripts/rvm && ~/.bin/lidwatch >> /home/leucos/what 2>&1  
#  ruby ~/.bin/lidwatch >> /home/leucos/what 2>&1  
#  ruvy -v >> /home/leucos/what 2>&1
  ~leucos/.bin/lidwatch &
  exec i3 --force-xinerama -V >>~/.i3/i3log 2>&1
#  exec ck-launch-session dbus-launch i3 --force-xinerama -V >>~/.i3/i3log 2>&1
  ;;
wmfs)
  exec wmfs
  ;;
*)
  exec $DEFAULT_SESSION
  ;;
esac
