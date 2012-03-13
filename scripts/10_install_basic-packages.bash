#!/usr/bin/env bash

echo
echo "=============================="
echo "Installing rbenv"
echo "=============================="

# Update, upgrade and install development tools
sudo apt-get update
#sudo apt-get -y upgrade
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

