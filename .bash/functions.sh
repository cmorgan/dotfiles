function diary() {
  vi ~/docs/d/$(date "+%y%m%d").rst
}

function workon() {
    source activate $1
}

function set_jh {
  var_name=JAVA_HOME$1
  export JAVA_HOME="${!var_name}"
  echo $JAVA_HOME
}

function pylint {
  pylint -f parseable -E -d E0213,E1101,E1002,E1121,E0211,E0611,E0602,E1103
}

function count {
    ls -1AU $* | wc -l
}

function dirsize {
    du -sk .[!.]* *|sort -n
}

function nose(){
    nosetests -sdv $(find . -type f -name "$1*" ! -name "*.pyc")
}

function n(){
    nosetests -sdv $1
}

function f(){
    find . -type f -name "$1*" ! -name "*.pyc"
}

function fpy(){
    find . -type f -name "$1*.py" ! -name "*.pyc"
}

function fvi(){
    vi -p `find . -type f -name "$1*" ! -name "*.pyc"`
}

# open python file in vi
function pvi(){
    vi -p `find . -type f -name "$1*.py" ! -name "*.pyc"`
}

function vigim(){
    vi -p `git status --short | grep M | awk '{print $2}'`
    #vim -p `git status --porcelain | sed -ne 's/^ M //p'`
}


function tfind {
    find . -type f ! -iname "*.pyc" ! -iname "*.pack" -print0 | xargs -0 grep -sl $1
}


function pyfind {
    find . -name "*.py" -type f ! -iname "*.pyc" ! -iname "*.pack" -print0 | xargs -0 grep -sl $1
}


function tfindvi {
    vi -p `find . -type f ! -iname "*.pyc" ! -iname "*.pack" -print0 | xargs -0 grep -sl $1`
}


function myip {
    curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*'
}


function toucht {
    open ~/Dropbox/notes/pers/Touch_typing.jpg
}


function gitrm {
    for i in `git status | grep deleted | awk '{print $3}'`; do git rm $i;
    done
}


function gitbr {
    for k in `git branch|sed s/^..//`;do echo -e `git log -1 \
    --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" "$k"`\\t"$k";done|sort
}


# Dayjob ToDo
function todo() { if [ $# == "0" ]; then cat ~/epistle/ToDo.txt;
    else echo "* $@" >> ~/epistle/ToDo.txt;
    fi;
    }

function todone() { sed -i -e "/$*/d" ~/epistle/ToDo.txt;}

function hl() { sudo hamster-cli list;}
function hdo() { sudo hamster-cli start $1; }
function hdone() { sudo hamster-cli stop $1;}

# Personal ToDo
function ptodone() { sed -i -e "/$*/d" ~/epistle/pers_todo.txt;}
function ptodo() { if [ $# == "0" ]; then cat ~/epistle/pers_todo.txt;
    else echo "* $@" >> ~/epistle/pers_todo.txt;
    fi;
    }

function vpt(){
  vi ~/epistle/pers_todo.txt
}


# Networkscale ToDo
function ntodo() { if [ $# == "0" ]; then cat ~/epistle/netscale_todo.txt;
    else echo "* $@" >> ~/epistle/netscale_todo.txt;
    fi;
    }


function ntodone() { sed -i -e "/$*/d" ~/epistle/netscale_todo.txt;}


function reorder() {
    # re-number tmux sessions
    for session in $(tmux ls | awk -F: '{print $1}') ;do
        inum=0
        upto=8
        for window in $(tmux lsw -t $session | awk -F: '/^[0-9*]/ {print $1}') ;do
            if [ ${window} -gt ${inum} ] ;then
                if [ ${window} -lt ${upto} ] ;then
                    echo "${session}:${window} -> ${session}:${inum}"
                    tmux movew -d -s ${session}:${window} -t ${session}:${inum}
                fi
            fi
            inum=$((${inum}+1))
        done
    done
}


function gd() {
    git diff $@
    }


function grails_version() {
if [ $# == 1 ]; then

    if [ $1 == 1 ]; then
        echo 'activating grails 1.x';
        rm -f /opt/grails/grails;
        ln -s /opt/grails/grails-1.3.9 /opt/grails/grails
    else
        echo 'activating grails 2.x';
        rm -f /opt/grails/grails;
        ln -s /opt/grails/grails-2.2.0 /opt/grails/grails
    fi

else
    echo 'args either 1 or 2 for grails version'
fi
}


function doalarm(){
    # from
    # http://stackoverflow.com/questions/601543/command-line-command-to-auto-kill-a-command-after-a-certain-amount-of-time
    # an alarm(2) is inherited by across execve(2) and alarm is fatal by
    # default thereofre we can start a program with
    # doalarm 10  program.sh  and the program will die
    #
    perl -e 'alarm shift; exec @ARGV' "$@";
    }


function keepass(){
    # starts keepass for 50mins
    doalarm 3000 /Applications/KeePassX.app/Contents/MacOS/KeePassX ~/drop/kee/pass.kdb &
}


# moves a tmux window before a specified window
function move-before(){
    for ((i=$1; i<$2-1; i++))
    do
        tmux swap-window -s :$i -t :$((i+1))
    done
}


function is_submodule() {
    local git_dir parent_git module_name path strip
    # Find the root of this git repo, then check if its parent dir is also a repo
    git_dir="$(git rev-parse --show-toplevel)"
    parent_git="$(cd "$git_dir/.." && git rev-parse --show-toplevel 2> /dev/null)"

    if [[ -n $parent_git ]]; then
        strip=$((${#parent_git} + 1))
        module_name=${git_dir:$strip}
        # List all the submodule paths for the parent repo
        while read path
        do
            if [[ "$path" != "$module_name" ]]; then continue; fi
            if [[ -d "$parent_git/$path" ]]; then
                echo $module_name
                return 0;
            fi
        done < <(cd $parent_git && git submodule --quiet foreach 'echo $path' 2> /dev/null)
    fi
    return 1
}

# open in vim any touched files
function gvi() {
    vi -p $(git status --short | awk '$1 ~ /^M$/ {print $2}')
}


check_virtualenv() {
    if [ -e .venv ]; then
        env=`cat .venv`
        if [ "$env" != "${VIRTUAL_ENV##*/}" ]; then
            echo "Found .venv in directory. Calling: workon ${env}"
            workon $env
        fi
    fi
}


venv_cd () {
    builtin cd "$@" && check_virtualenv
}
# Call check_virtualenv in case opening directly into a directory (e.g
# when opening a new tab in Terminal.app).
check_virtualenv
