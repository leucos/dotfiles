#!/usr/bin/env bash

echo
echo "=============================="
echo "Installing ruby"
echo "=============================="

. utils/functions.sh

rbenv install 2>&1 | grep '^  [^ ]' | column

# Convoluted... will break really soon...
DEFAULT=`rbenv install 2>&1 | grep '^  [^ ]' | grep '1.9.3-p[0-9]' | tail -1 | cut -f 3 -d' '`

echo
echo "Select which version you want to install [$DEFAULT] "
read resp

if [ "x$resp" == "x" ]; then
	resp=$DEFAULT
fi

echo "RESP is $resp"

echo -n "Installing requirements for " 

case "$resp" in
  jruby*)
    echo " JRUBY"
    install_packages_for "jruby"
    ;;
  *)
    echo " MRI/..."
    install_packages_for "ruby"
    ;;
esac

rbenv install $resp || exit

echo "Make it default ruby [y/n] ? "
read yor

if [ $yor == "y" ]; then
	rbenv global $resp
fi

# Rehash
rbenv rehash

