#!/usr/bin/env bash

echo
echo "=============================="
echo "Installing ruby"
echo "=============================="

rbenv install 2>&1 | grep '^  [^ ]' | column

# Convoluted... will break really soon...
DEFAULT=`rbenv install 2>&1 | grep '^  [^ ]' | grep '1.9.3-p[0-9]' | tail -1 | cut -f 3 -d' '`

echo
echo "Select which version you want to install [$DEFAULT] "
read resp

if [ "x$resp" == "x" ]; then
	resp=$DEFAULT
fi

# should install requirements according to ruby & os

# For Ruby / Ruby HEAD (MRI, Rubinius, & REE), install the following:
#ruby: pacman -Sy --noconfirm gcc patch curl zlib readline libxml2 libxslt git autoconf diffutils make libtool bison subversion

# For JRuby, install the following:
#jruby: pacman -Sy --noconfirm jdk jre curl
#jruby-head: pacman -Sy apache-ant

# For IronRuby, install the following:
#ironruby: pacman -Sy --noconfirm mono



rbenv install $resp || exit

echo "Make it default ruby [y/n] ? "
read yor

if [ $yor == "y" ]; then
	rbenv global $resp
fi

# Rehash
rbenv rehash

