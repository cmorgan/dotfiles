#!/bin/bash


function link {
	ln -sf $HOME/src/dotfiles/$1 $HOME/$1
}


bash=(.bash .bashrc .bash_profile)
vim=(.vim .vimrc)
git=(.git-prompt .gitconfig .git-prompt.sh)
other=(.inputrc .tmux.conf)

for x in ${bash[@]}; do
	link $x
done

for x in ${vim[@]}; do
	link $x
done

for x in ${git[@]}; do
	link $x
done

for x in ${other[@]}; do
	link $x
done