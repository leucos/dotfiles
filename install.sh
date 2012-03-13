#!/usr/bin/env bash

if [ $0 != "./install.sh" ]; then
	echo "Sorry, this script must be invoked as ./install.sh (cd ~/.dotfiles ?)"
	exit
fi


OS=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VERSION=$(awk '/DISTRIB_RELEASE=/' /etc/*-release | sed 's/DISTRIB_RELEASE=//' | sed 's/[.]0/./')

if [ -z "$OS" ]; then
    OS=$(awk '{print $1}' /etc/*-release | tr '[:upper:]' '[:lower:]')
fi

if [ -z "$VERSION" ]; then
    VERSION=$(awk '{print $3}' /etc/*-release)
fi

echo "OS      : $OS"
echo "ARCH    : $ARCH"
echo "VERSION : $VERSION"
echo
echo "=============================="
echo "Installing dotfiles"
echo "=============================="

BEHAVE="n"

for i in files/*; do
	DEST=$HOME/.`basename $i`
	DOIT=0
	if [ -r $DEST ]; then
		# The file already exists
		echo -n "File $DEST already exists..."
		case $BEHAVE in
			"A")
			DOIT=1
			;;

			"N")
			DOIT=0
			;;

			*)
			echo -n "overwrite [y/n/A/N] ? "
			read BEHAVE
			if [ $BEHAVE == "y" ]; then 
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

for i in `ls templates/*`; do 
	ACTION=`echo $i | sed -e 's/.*\/\(.*\)\.erb/\1/'`
	echo
	echo -n "* Install $ACTION [y/n] ? "
	read resp
	if [ "x$resp" == "xy" ]; then
		erb $i > $HOME/."$ACTION"
		echo "  => wrote $HOME"/."$ACTION" 
	fi
done

source ~/.bashrc

echo
echo "=============================="
echo "Installing scripts"
echo "=============================="

for i in `ls scripts/*`; do 
	ACTION=`echo $i | sed -e 's/.*_\(.*\)\.bash/\1/'`
	echo
	echo -n "* Install $ACTION [y/n] ? "
	read resp
	if [ "x$resp" == "xy" ]; then
		echo " => Executing $i"
		bash $i
	fi
done

