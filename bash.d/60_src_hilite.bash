HL=`which src-hilite-lesspipe.sh`

[ -x $HL ] || exit

export LESSOPEN="| $HL %s"
export LESS=' -R '

