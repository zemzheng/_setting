#!/bin/sh
# ~/.gitconfig
# [diff]
#   tool = vscode
# [difftool "vscode"]
#   cmd = <PATH_TO_THIS_FLODER>/wsl_vscode_diff.sh $LOCAL $PWD/$REMOTE
code -r -d $1 $2
