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
alias dual='ln -sf /etc/X11/xorg.conf.dual /etc/X11/xorg.conf'
alias single='ln -sf /etc/X11/xorg.conf.single /etc/X11/xorg.conf'
alias projector='ln -sf /etc/X11/xorg.conf.projector /etc/X11/xorg.conf'
alias urtilde='urbanterror +connect 88.190.17.133:12345 +set password "avr" +set rconPassword avr'
