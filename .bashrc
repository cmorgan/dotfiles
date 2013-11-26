# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

BASH_ROOT="$HOME/.bash"
for config in "functions" "vars" "prompt" "aliases"; do
	[ -f ${BASH_ROOT}/${config} ] && . ${BASH_ROOT}/${config}
done
PATH=$PATH:/opt/phantomjs/bin:/opt/casperjs/bin
