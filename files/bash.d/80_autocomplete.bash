# complete from ssh in history
complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh \([a-zA-Z0-9_-@]*\).*/\1/'))" ssh

