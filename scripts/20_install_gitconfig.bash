#!/usr/bin/env bash

echo -n "Your Name: "
read NAME
echo -n "Your Email: "
read EMAIL
echo -n "GitHub Username :"
read GHNAME
echo -n "GitHub API Key  :"
read GHKEY

export NAME EMAIL GHNAME GHKEY


cat <<EOF> /home/$USER/.gitconfig

# Generated github config

[user]
  name = $NAME
  email = $EMAIL

[color]
  diff = auto
  status = auto
  branch = auto

[core]
  excludesfile = /home/$USER/.gitignore
  editor = vim
  autocrlf = input

[apply]
  whitespace = nowarn

[format]
  pretty = %C(yellow)%h%Creset %s %C(red)(%an, %cr)%Creset

[github]
  user = $GHNAME
  token = $GHKEY

[merge]
  tool = meld

[alias]
  ci = commit
  co = checkout
  st = status
  br = branch
  lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)[%an]%Creset' --abbrev-commit --date=relative
  llg = log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short
  ctags = !.git/hooks/ctags

[diff "odf"]
  textconv=odt2txt

[giggle]
  main-window-maximized = false
  main-window-geometry = 994x739+232+59
  main-window-view = HistoryView
  file-view-vpane-position = 252
  history-view-vpane-position = 433

[init]
  templatedir = ~/.git_template

EOF

