#!/bin/bash

function link {
	ln -sf $HOME/src/dotfiles/$1 $HOME/$1
}

for x in .bash .bashrc .vim .vimrc .inputrc .git-prompt .gitconfig .git-prompt.sh .tmux.conf; do
	link $x
done
