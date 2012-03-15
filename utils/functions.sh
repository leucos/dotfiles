#!/usr/bin/env bash

get_os()
{

  OS=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
  ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
  VERSION=$(awk '/DISTRIB_RELEASE=/' /etc/*-release | sed 's/DISTRIB_RELEASE=//' | sed 's/[.]0/./')

  if [ -z "$OS" ]; then
    OS=$(awk '{print $1}' /etc/*-release | tr '[:upper:]' '[:lower:]')
  fi

  if [ -z "$VERSION" ]; then
    VERSION=$(awk '{print $3}' /etc/*-release)
  fi

  if [ -z "$OS" ]; then
    if [ -r /etc/arch-release ]; then
      OS="arch"
    fi
  fi

  echo "OS      : $OS"
  echo "ARCH    : $ARCH"
  echo "VERSION : $VERSION"
}

set_installers() {
  if [ -z "$OS" ]; then
    get_os
  fi

  case "$OS" in
    "arch")
      if `which yaourt`; then 
        PREPKG='yaourt -Sy'
        PKGMAN='yaourt -S '
      else
        PREPKG='pacman -Sy'
        PKGMAN='pacman -S '
      fi
      ;;
    "ubuntu"|"debian")
      PREPKG='apt-get update'
      PKGMAN='apt-get install -y '
      ;;
    "redhat"|"centos")
      PREPKG='yum update'
      PKGMAN='yum install -y '
      ;;
esac
}

install_packages() {
  set_installers

  if [ $USER != "root" ]; then
    PRECMD="sudo"
  fi

  $PRECMD $PREPKG
  $PRECMD $PKGMAN $*
}
