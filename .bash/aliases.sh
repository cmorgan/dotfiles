# colorize commands
if [ "x$USE_COLORS" = "xY" ]; then
    if [ `uname` = "Darwin" ]; then
        export LSCOLORS=Exfxcxdxbxegedabagacad
        alias ls='ls -G'
    else
        alias ls='ls --color=auto'
    fi
    alias grep='grep --color=auto'
else
    alias ipython='ipython --colors NoColor'
fi

# ls aliases
alias l='ls -1Ftr'
alias lf='ls -1f'
alias ll='l -1latr'
alias lc='l -1C'
alias em='emacsclient -c -nw'

# git
alias gs='git st'
alias gps='git push'
alias gpl='git pull'
alias gl='git l'
alias gdummy='git commit -a -m"stuff" && gps'

# for safety
alias rm='rm -i'

alias gtypist='gtypist -b -e1'
alias diff='colordiff'

alias trade='tmux attach -t trade'
alias trade2='tmux attach -t trade2'
alias research='tmux attach -t research'
alias research2='tmux attach -t research2'
alias cd=venv_cd
alias open='gnome-open'
alias moff='xset dpms force off'
alias on='source activate'
alias off='source deactivate'

# conda
alias on='source activate'
alias off='source deactivate'

# py
alias ipy='ipython'
# Solo
alias tas="source $TAS_HOME/tools/workstation/aliases.sh; ssh-add $TAS_HOME/devops/security/gss-developers.pem"
alias ahoy="source $AHOY_HOME/tools/workstation/aliases.sh"
alias slock="moff && slock"
