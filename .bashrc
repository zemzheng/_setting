
alias .="cd -"
alias ..="cd .."
alias ...="cd ../../"

alias c="clear"

alias gs="git status -sb"
alias gd="git diff"
alias ga="git add -A && git commit"
alias gk="gitk --all &"
alias gt="git log --pretty=oneline --graph --all --decorate"

function v(){
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

function vn(){
    if [ ! -n "$1" ] ; then
        gvim . &
    else
        echo $1
        gvim $1 &
    fi
}

function e(){
    explorer $*
}

function zhelper_base(){
    echo "# ## .   = cd -"
    echo "# ## ..  = cd .."
    echo "# ## ... = cd ../../"
    echo "# ## c   = clear"
    echo "# ## e   = explorer"
    echo "# ## v   = gvim --remote-tab-silent \$1 &"
    echo "# ## vn  = gvim . \$1 &"
    echo "# ## gs  = git status -sb"
    echo "# ## gd  = git diff"
    echo "# ## ga  = git add -A && git commit"
    echo "# ## gk  = gitk --all &"
    echo "# ## gt  = git log and show as tree"
}
