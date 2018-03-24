# If not running interactively, don't do anything
#[ -z "$PS1" ] && return
#

BASH_ROOT="$HOME/.bash"
for config in "local.sh" "functions.sh" "vars.sh" "prompt.sh" "aliases.sh"; do
  [ -f ${BASH_ROOT}/${config} ] && . ${BASH_ROOT}/${config}
done

export GOPATH="$HOME/src/other/go"
export GOPATH=$HOME/src/go
export GOBIN="$HOME/src/other/go/bin"
export PATH=$PATH:"$HOME/src/other/go/bin"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/src/go/bin
export PATH=$PATH:$HOME/src/q/scripts


# added by Miniconda2 3.19.0 installer
export PATH="/home/chris/miniconda2/bin:$PATH"
export PIP_REQUIRE_VIRTUALENV=false

export PATH=/home/chris/miniconda/bin:$PATH

# Add color-coded git branch to bash prompt
# function git_branch {
#   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (*\([^)]*\))*/\1/'
# }

# function markup_git_branch {
#   if [[ -n $@ ]]; then
#     if [[ -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
#       echo -e " \001\033[32m\002($@)\001\033[0m\002"
#     else
#       echo -e " \001\033[31m\002($@)\001\033[0m\002"
#     fi
#   fi
# }

# export PS1="\h:\W\$(markup_git_branch \$(git_branch)) \u$ "

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

