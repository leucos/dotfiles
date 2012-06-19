#/usr/bin/env bash

echo
echo "=============================="
echo "Installing rbenv"
echo "=============================="


echo -e "\n\n========================================================"
if [ "$USER" == "root" ]; then
  PREFIX="/usr/local/rbenv"
  ENVSCRIPT="/etc/profile.d/rbenv.sh"
  echo -e "About to install rbenv SYSTEM WIDE in $PREFIX.\nPress enter to continue, Ctrl-C to quit"
  read
else
  PREFIX="$HOME/.rbenv"
  ENVSCRIPT="$HOME/.dotfiles/files/bash.d/55_rbenv.bash"
  echo -e "About to install rbenv for user $USER in $PREFIX\nPress enter to continue, Ctrl-C to quit"
  read
fi

if [ -d $PREFIX ]; then
  echo -e "rbenv seems already installed. Bailing out.\n"
  exit
fi

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git $PREFIX

# Install environnement stuff
echo '# rbenv setup' > $ENVSCRIPT
echo "export PREFIX=$PREFIX" >> $ENVSCRIPT
echo 'export PATH="$PREFIX/bin:$PATH"' >> $ENVSCRIPT
echo 'eval "$(rbenv init -)"' >> $ENVSCRIPT
chmod +x $ENVSCRIPT
source $ENVSCRIPT

# Install ruby-build:
mkdir -p "$PREFIX"/plugins
cd "$PREFIX"/plugins
git clone git://github.com/sstephenson/ruby-build.git

