# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

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


# added by Miniconda2 3.19.0 installer
export PATH="/home/chris/miniconda2/bin:$PATH"
