
alias .="cd -"
alias ..="cd .."
alias ...="cd ../../"

alias c="clear"

alias cgs="clear && git status -sb"
alias gs="git status -sb"
alias gd="git diff"
alias ga="git add -A && git commit"
alias gk="gitk --all &"
alias gt="git log --pretty=oneline --graph --all --decorate"

function vo(){
    if [ ! -n "$1" ] ; then
        gvim . &
    else
        echo $1
        if [ ! -d $1 ] ; then
            gvim --remote-tab-silent $1 &
        else
            gvim $1 &
        fi
    fi
}

function gg(){
    tmp="";
    for f in `grep "$1" $2 -r -l`; do
        tmp="$tmp $f" ;
    done;
    gvim -p $tmp &
}

function e(){
    if [ x"$1" = x"" ]; then
        explorer . &
    else
        explorer $* &
    fi
}

function zz_base(){
    printf "%10s---%s\n" "----------" "-----------------------------------------------------------"
    alias | awk -F 'alias' '{print $2}' | awk -F '=' '{printf "%10s | %s\n", $1, $2}' | sed "s/'//g"
    printf "%10s---%s\n" "----------" "-----------------------------------------------------------"
    echo ""
}
