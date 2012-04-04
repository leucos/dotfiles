#/usr/bin/env bash

echo
echo "=============================="
echo "Installing rvm"
echo "=============================="


echo -e "\n\n========================================================"

ENVSCRIPT="~/.dotfiles/files/bash.d/55_rubymanager.bash"

if [ "$USER" == "root" ]; then
  echo -e "Sorry, I won't install RVM as root, it just sucks"
  exit
fi

echo -e "About to install RVM for user $USER\nPress enter to continue, Ctrl-C to quit"
read

if [ -d '~/.rvm' ]; then
  echo -e "rvm seems already installed. Bailing out.\n"
  exit
fi

if [ -r $ENVSCRIPT ]; then
  echo -e "Another ruby manager (rbenv ?) is already installed. Bailing out.\n"
  exit
fi

# Install rvm
bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

# Install environnement stuff
echo "# this file is auto generated - don't edit it" > $ENVSCRIPT
echo '# rvm setup' >> $ENVSCRIPT
echo 'if [ -d "~/.rvm" ]; then' >> $ENVSCRIPT
echo '  PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"' >> $ENVSCRIPT
echo '  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> $ENVSCRIPT
echo 'fi' >> $ENVSCRIPT
chmod +x $ENVSCRIPT
source $ENVSCRIPT


