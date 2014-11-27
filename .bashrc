
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
        gvim $1 &
    fi
}

function zhelper_base(){
    echo "# ## .   = cd -"
    echo "# ## ..  = cd .."
    echo "# ## ... = cd ../../"
    echo "# ## c   = clear"
    echo "# ## v   = gvim . &"
    echo "# ## gs  = git status -sb"
    echo "# ## gd  = git diff"
    echo "# ## ga  = git add -A && git commit"
    echo "# ## gk  = gitk --all &"
    echo "# ## gt  = git log and show as tree"
}
