# cd
alias ..='cd ..'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    COLOR=' --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
fi

alias grep="grep $COLOR"
alias fgrep="fgrep $COLOR"
alias egrep="egrep $COLOR"

# ls
alias ls="ls -F $COLOR"
alias l="ls -lAh $COLOR"
alias ll="ls -l $COLOR"
alias la='ls -A $COLOR'
alias lart="ls -lart $COLOR"

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

# One instance to rule them all
alias gvim="gvim --remote-tab-silent"

# enable color support of ls and also add handy aliases

# rails
#alias sc='script/console'
#alias ss='script/server'
#alias sg='script/generate'
#alias a='autotest -rails'
#alias tlog='tail -f log/development.log'
#alias scaffold='script/generate nifty_scaffold'
#alias migrate='rake db:migrate db:test:clone'
#alias rst='touch tmp/restart.txt'

# commands starting with % for pasting from web
alias %=' '

# redcar 
alias redcar=wrapped_redcar

# misc
say() {
	mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?tl=en&q=$(echo $* | sed 's#\ #\+#g')" > /dev/null 2>&1 ; 
}

urtilde() {
  if test -z "$1"; then 
    echo "No command-line arguments. Please provide rcon password."
    exit
  fi

  urbanterror +connect 88.190.17.133:12345 +set password "$1" +set rconPassword "$1"
}

alias dual='ln -sf /etc/X11/xorg.conf.dual /etc/X11/xorg.conf'
alias single='ln -sf /etc/X11/xorg.conf.single /etc/X11/xorg.conf'
alias projector='ln -sf /etc/X11/xorg.conf.projector /etc/X11/xorg.conf'

alias i3restart='feh --bg-fill ~/Images/backgrounds/steph5.jpg; i3-msg "restart"'
alias dual='disper -d auto -e -t right; i3restart'
alias clone='disper -c; i3restart'
alias single='disper -s; i3restart'

# Opens gnome-terminal in the last accessed directory
alias gt='gnome-terminal --working-directory `cat ~/.lastcd`'

# Sublme Text shortcut
alias sl="subl -ab"

# One line file server
alias fileserve="ruby -rwebrick -e\"s = WEBrick::HTTPServer.new(:Port => 3000, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start\""

# Tmux
alias ta="tmux attach"
alias tu="tmux -u"
alias tstart="[ ! -d /var/tmux ] && sudo mkdir -p 777 /var/tmux; tmux -S /var/tmux/pairing new-session -d -s pairing -n main 'bash'"
alias tstop="tmux -S /var/tmux/pairing kill-server"
alias tattach="tmux -S /var/tmux/pairing -2 attach -t pairing"
