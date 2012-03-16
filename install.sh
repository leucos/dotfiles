#!/usr/bin/env bash

if [ $0 != "./install.sh" ]; then
  echo "Sorry, this script must be invoked as ./install.sh (cd ~/.dotfiles ?)"
  exit
fi

echo 
echo "Dotfiles installer"
echo "=================="

echo -e "\nThis script will install the following stuff :"

echo -e "\t• dotfiles for vim, tmux, htop, etc... (see list in files/)"
echo -e "\t• ~/.gitconfig, asking your for information"
echo -e "\t• rbenv to manage your rubies"
echo -e "\t• a ruby of your choice (MRI, Rubinius, JRuby)"
echo -e "\t• vim plugins (see list in scripts/90_bootstrap-vim.bash)"

echo -e "\nWhen asked questions, the following replies can be made :"
echo -e "\t• y : yes"
echo -e "\t• n : yes"
echo -e "\t• A : always (always yes)"
echo -e "\t• N : never (always no)"
echo -e "\t• q : quit"
echo -e "\t•   : use default shown in parens. The default is set to whatever the last reply was."

echo -e "\nThis should probably work on Ubuntu/Debian, Redhat/CentOS and Arch"
echo "Please open issues at https://github.com/leucos/dotfiles if needed"

echo -e "\nHandle with care.\n"

. utils/functions.sh

get_os

echo "Your seem to be on $OS version $VERSION running on $ARCH bits architecture"
echo
echo "=============================="
echo "Installing dotfiles"
echo "=============================="

lastresp="n"

for i in files/*; do
  DEST=$HOME/.`basename $i`
  DOIT=0
  if [ -r $DEST ]; then
    # The file already exists
    echo -n "File $DEST already exists..."
    
    case $resp in
      "A")
        DOIT=1
        ;;

      "N")
        DOIT=0
        ;;

      *)
        echo -n "overwrite [y/n/A/N/q] ($lastresp) ? "
        read resp

      # If resp is empty, we assume the user wants to repeat his last answer
      # Otherwise, we store this answer in lastrep for next time
      if [ -z $resp ]; then
        resp=$lastresp
      else
        lastresp=$resp
      fi

      if [ $resp == "q" ]; then 
        exit
      elif [ $resp == "y" ]; then 
        DOIT=1
      else
        DOIT=0
      fi
      ;;
    esac
  else
    echo -n "Linking file $i to $DEST"
    DOIT=1
  fi

  if [ $DOIT -eq 1 ]; then
    if [ -d $DEST ]; then
      rm -rf $DEST 
    fi

    ln -sf `pwd`/$i $DEST
    echo -e "\t => installed"
  else
    echo -e "\t => skipped"
  fi
done

echo
echo "=============================="
echo "Installing templates"
echo "=============================="

lastrep="n"

for i in `ls templates/*`; do 
  ACTION=`echo $i | sed -e 's/.*\/\(.*\)\.erb/\1/'`
  echo
  echo -n "* Install $ACTION [y/n/q] ($lastrep) ? "
  read resp

  # If resp is empty, we assume the user wants to repeat his last answer
  # Otherwise, we store this answer in lastrep for next time
  if [ -z $resp ]; then
    resp=$lastrep
  else
    lastrep=$resp
  fi

  if [ "$resp" == "y" ]; then
    erb $i > $HOME/."$ACTION"
    echo "  => wrote $HOME"/."$ACTION" 
  elif [ "$resp" == "q" ]; then
    exit
  fi 
done

source ~/.bashrc

echo
echo "=============================="
echo "Installing scripts"
echo "=============================="

lastrep="n"

for i in `ls scripts/*`; do 
  ACTION=`echo $i | sed -e 's/.*_\(.*\)\.bash/\1/'`
  echo
  echo -n "* Install $ACTION [y/n/q] ($lastrep) ? "
  read resp

  # If resp is empty, we assume the user wants to repeat his last answer
  # Otherwise, we store this answer in lastrep for next time
  if [ -z $resp ]; then
    resp=$lastrep
  else
    lastrep=$resp
  fi

  if [ "$resp" == "y" ]; then
    echo " => Executing $i"
    bash $i
  elif [ "$resp" == "q" ]; then
    exit
  fi
done

