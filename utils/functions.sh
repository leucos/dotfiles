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


install_packages_for() {
  get_os
  case "$OS" in
    "ubuntu"|"debian")
      if [ "x$1" == "xjruby" ]; then
        install_packages curl g++ openjdk-6-jre-headless openjdk-6-jdk
      else
        install_packages build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion
      fi
      ;;
    "arch")
      if [ "x$1" == "xjruby" ]; then
        install_packages jdk jre curl apache-ant
      else
        install_packages gcc patch curl zlib readline libxml2 libxslt git autoconf diffutils make libtool bison subversion
      fi
      ;;
    "centos"|"redhat")
      if [ "x$1" == "xjruby" ]; then
        install_packages java
      else
        install_packages patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison 
      fi
      ;;
  esac
}

