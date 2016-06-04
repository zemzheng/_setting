
alias .="cd -"
alias ..="cd .."
alias ...="cd ../../"

alias c="clear"
alias cgs="clear && git status -sb"
alias gs="git status -sb"
alias gdc="git diff --word-diff"
alias gd="git difftool --tool=winmerge"
# alias ga="git add"
alias gm="git commit"
alias gu="git add -A && git commit"
alias gk="gitk --all -new_console:s &"
alias gt="git log --pretty=oneline --graph --all --decorate"
# alias gc="git checkout"
alias gf='git fetch origin --prune'
alias gc='for k in $( git branch | grep -v "*" ); do git branch -d $k; done;'
alias sb="source ~/.bashrc"

function v(){
    gvim $* &
}
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
        vo $f;
    done;
}

function e(){
    if [ x"$1" = x"" ]; then
        explorer . &
    else
        explorer $* &
    fi
}

# git config --global alias.co checkout
# git config --global alias.br branch
# git config --global alias.ci commit
# git config --global alias.st status

function zz_base(){
    printf "%10s---%s\n" "----------" "-----------------------------------------------------------"
    echo "  [shell]"
    alias | awk -F 'alias' '{print $2}' | sed "s/='/###/g" | awk -F '###' '{printf "%10s | %s\n", $1, $2}' | sed "s/'//g"
    printf "%10s---%s\n" "----------" "-----------------------------------------------------------"
    echo "  [git]"
    git config --global -l | grep 'alias.' | awk -F 'alias.' '{print $2}' | awk -F '=' '{printf "%10s | %s\n", $1, $2}'
    printf "%10s---%s\n" "----------" "-----------------------------------------------------------"
    echo ""

}
