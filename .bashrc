# If not running interactively, don't do anything
#[ -z "$PS1" ] && return
#

BASH_ROOT="$HOME/.bash"
for config in "local.sh" "functions.sh" "vars.sh" "prompt.sh" "aliases.sh"; do
  [ -f ${BASH_ROOT}/${config} ] && . ${BASH_ROOT}/${config}
done

source ~/.git-prompt.sh

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
#PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
# export GIT_PS1_SHOWDIRTYSTATE=1
# BLACK="\[\033[0;0m\]"
# BLUE="\[\033[0;34m\]"
# BROWN="\[\033[0;33m\]"
# COLOR_NONE="\[\e[0m\]"
# CYAN="\[\033[0;36m\]"
# GREEN="\[\033[0;32m\]"
# LIGHT_GRAY="\[\033[1;37m\]"
# LIGHT_GREEN="\[\033[1;32m\]"
# LIGHT_RED="\[\033[1;31m\]"
# PURPLE="\[\033[0;35m\]"
# RED="\[\033[0;31m\]"
# WHITE="\[\033[0;37m\]"
# YELLOW="\[\033[0;33m\]"


# #export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
# function prompt_func() {
#     previous_return_value=$?;
#     TITLEBAR='\[\e]2;\w\a\]'
#     prompt="${TITLEBAR}${PURPLE}\u@\h ${BLUE}\W${GREEN}$(__git_ps1)${COLOR_NONE} "
#     if test $previous_return_value -eq 0
#     then
#         PS1="${prompt}\$ "
#     else
#         PS1="${prompt}${RED}\$${COLOR_NONE} "
#     fi
# }

# export PROMPT_COMMAND=prompt_func

if [ -f ~/.bashgit ]; then
    . ~/.bashgit
fi

PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w $(__git_ps1 "(%s)")\n\$ '

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

