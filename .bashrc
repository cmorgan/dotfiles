# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

BASH_ROOT="$HOME/.bash"
for config in "functions" "vars" "prompt" "aliases"; do
	[ -f ${BASH_ROOT}/${config} ] && . ${BASH_ROOT}/${config}
done

# TMUX
if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux -2 attach || tmux -2 new-session)
fi

PATH=$PATH:/opt/phantomjs/bin:/opt/casperjs/bin:/opt/scilab/scilab-5.4.1/bin
