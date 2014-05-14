# If this is an xterm use colors
case "$TERM" in
linux|xterm*|rxvt*|screen*)
    USE_COLORS=Y
    ;;
esac
# don't like colors...
# USE_COLORS=N

if [ -n "$DISPLAY" -a "$COLORTERM" == "gnome-terminal" ]; then
    export TERM=xterm-256color
fi

# git bash completion
for git_compl in "/etc/bash_completion.d/git" "/usr/share/git/completion/git-prompt.sh" "/usr/share/git/completion/git-completion.bash"; do
        [ -f ${git_compl} ] && . ${git_compl}
done

if [ "x$USE_COLORS" = "xY" ]; then
	git config --global color.ui true
fi

export PATH=$HOME/bin:$HOME/src/cmd:$HOME/.cabal/bin:/usr/bin/site_perl:/usr/local/pgsql/bin/:/usr/bin/vendor_perl:/opt/SenchaSDKTools-2.0.0-beta3/:$PATH
export EDITOR="vim"
export GIT_EDITOR="vim"

if [ `which chromium` ]; then
    export BROWSER="chromium"
fi

export RHINO_HOME=/usr/share/java
# Treat well escape chars
export LESS="-R"

# vi keybindings for bash
# set -o vi
export VIMRUNTIME=/usr/share/vim/vimcurrent/

# remap some keys
[ -f ~/.xmodmap ] && xmodmap ~/.xmodmap

# enable color support of ls
# [ -x dircolors ] && eval "`dircolors -b`"
eval "`dircolors ~/.bash/dir_colors`"

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups

# for gpg
export GPG_TTY=`tty`

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you git in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Python version
export PYVER=2.7
if [ -f "$HOME/.pyrc" ]; then
    export PYTHONSTARTUP="$HOME/.pyrc"
fi

# virtualenv
if [ "$PYVER" == "2.7" ]; then
        WORKON_HOME=$HOME/.virtualenvs
        VIRTUALENVWRAPPER_PYTHON=`which python2`
        if [ -x "/usr/bin/virtualenv2" ]; then
                VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2
        else
                VIRTUALENVWRAPPER_VIRTUALENV=`which virtualenv`
        fi
	if [ -f "/etc/bash_completion.d/virtualenvwrapper" ]; then
		source /etc/bash_completion.d/virtualenvwrapper
	elif [ `which virtualenvwrapper.sh` ]; then
		source `which virtualenvwrapper.sh`
	fi
else
        WORKON_HOME=$HOME/.virtualenvs-2.6
        VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.6
        VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
        source /usr/local/bin/virtualenvwrapper.sh
fi

# pip
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

# postgres
export PGDATA=/home/postgres

source ~/.git-prompt.sh

PATH=$PATH:/opt/phantomjs/bin:/opt/casperjs/bin:/opt/scilab/scilab-5.4.1/bin
#PATH=$PATH:$HOME/.jenv/bin
# search bash history using arrow keys
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
#eval "$(jenv init -)"

export EC2_HOME=/home/chris/src/aws/ec2-api-tools-1.6.6.3
export AWS_AUTO_SCALING_HOME=/home/chris/src/aws/AutoScaling-1.0.61.2
export AWS_IAM_HOME=/home/chris/src/aws/IAMCli-1.5.0
export AWS_CLOUDWATCH_HOME=/home/chris/src/aws/CloudWatch-1.0.12.1
export AWS_ELB_HOME=/home/chris/src/aws/ElasticLoadBalancing-1.0.17.0
export AWS_RDS_HOME=/home/chris/src/aws/RDSCli-1.10.003
export AWS_CLOUDFORMATION_HOME=/home/chris/src/aws/AWSCloudFormation-1.0.12
export PATH=$EC2_HOME/bin:$PATH
export PATH=$AWS_AUTO_SCALING_HOME/bin:$PATH
export PATH=$AWS_CLOUDWATCH_HOME/bin:$PATH
export PATH=$AWS_IAM_HOME/bin:$PATH
export PATH=$AWS_ELB_HOME/bin:$PATH
export PATH=$AWS_RDS_HOME/bin:$PATH
export PATH=$AWS_CLOUDFORMATION_HOME/bin:$PATH

export JAVA_HOME7=/usr/lib/jvm/java-7-oracle
export JAVA_HOME8=/usr/lib/jvm/java-8-oracle
export JAVA_HOME=$JAVA_HOME7

export AWS_CLOUDFORMATION_HOME=/home/chris/src/aws/AWSCloudFormation-1.0.12
export PATH=$AWS_CLOUDFORMATION_HOME/bin:$PATH
export CDPATH=$HOME:$HOME/src
export AWS_RDS_HOME=$HOME/bin/RDSCli-1.15.001
export PATH=$PATH:$AWS_RDS_HOME/bin
export AWS_CREDENTIAL_FILE=$HOME/.rds.config
export AHOY_HOME=/home/chris/src/ahoy

