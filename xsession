
DEFAULT_SESSION=twm

case $1 in
gnome*)
  exec ck-launch-session dbus-launch gnome-session
  ;;
i3)
  exec i3 --force-xinerama -V >>~/.i3/i3log 2>&1
  ;;
*)
  exec $DEFAULT_SESSION
  ;;
esac
