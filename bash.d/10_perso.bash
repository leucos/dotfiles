#!bash
#
# perso adddons for bash
# =======================

export PATH=$PATH:~/.bin:/usr/share/lib/shflags/
#
# History handling
#
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:??:exit:history"
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '
export HISTFILESIZE=10000

shopt -s cmdhist

# Cross shell last cd recording
trap 'pwd > ~/.lastcd' DEBUG

#
# Prompt hacking
#

# Function that returns last two directories components
function last2pwd {
  tmp=${PWD%/*/*};
  [ ${#tmp} -gt 0 -a "$tmp" != "$PWD" ] && echo ${PWD:${#tmp}+1} || echo $PWD;
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

[ -n "$SSH_CLIENT" ] && text=" REMOTE "
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@$(hostname)\[\033[00m\]\[\033[1;31m\]${text}\[\033[00m\]:\[\033[01;34m\]$(last2pwd)\[\033[00m\]\$ '
export PS1='${debian_chroot:+($debian_chroot)}\[\e[0;33m\]\u@$(hostname)\[\033[00m\]\[\033[1;31m\]${text}\[\033[00m\]:\[\033[01;34m\]$(last2pwd)\[\033[00m\]\$ '

# '\n\[\e[0;90m\][\h] [\[\e[0;33m\]\w\[\e[0;90m\]]\n\[\e[0;90m\][\[\e[0;31m\]\u\[\e[0;90m\]] >>\[\e[0m\] '  
