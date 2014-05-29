# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

BASH_ROOT="$HOME/.bash"
for config in "functions.sh" "vars.sh" "prompt.sh" "aliases.sh"; do
	[ -f ${BASH_ROOT}/${config} ] && . ${BASH_ROOT}/${config}
done

export GOPATH="$HOME/src/other/go"
export PATH=$PATH:"$HOME/src/other/go/bin"
