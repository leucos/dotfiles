
DEFAULT_SESSION=twm


## test for an existing bus daemon, just to be safe
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
## if not found, launch a new one
  eval `dbus-launch --sh-syntax --exit-with-session`
  echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
fi

if disper -l | grep 'DFP-1'; then
  dual
fi

case $1 in
gnome*)
  exec ck-launch-session dbus-launch gnome-session
  ;;
i3)
  ~leucos/.bin/lidwatch &
  export PAGER=less
  export EDITOR=vim
  export TERMINAL="gnome-terminal -e "

  exec i3 --force-xinerama -V > ~/.i3/log 2>&1
#  exec ck-launch-session dbus-launch i3 --force-xinerama -V >>~/.i3/i3log 2>&1
  ;;
wmfs)
  exec wmfs
  ;;
*)
  exec $DEFAULT_SESSION
  ;;
esac
