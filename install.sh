#!/usr/bin/env bash
# -*- coding: utf-8 -*-

git=`which git 2>&1`
if [ $? -ne 0 ]; then
	echo "Please install `git` before continue :-("
	exit 1
fi

gvim=`which gvim 2>&1`
if [ $? -ne 0 ]; then
	echo "Installing GVIM"
	case $( uname -s ) in
		Linux) sudo apt-get -y install vim-gnome;;

		Darwin) 
			brew=`which brew 2>&1`
			if [ $? -ne 0 ]; then
				echo 'Please install `brew` before continue :-('
				exit 1
			fi
			brew install macvim --override-system-vim
		;;

		*) echo 'Unsupported system install'; exit 1;;
	esac
fi

echo "Installing vim config"
rm -rf ~/.vim ~/.vimrc /.gvimrc
git clone git@github.com:iknite/vimconfig.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule sync
git submodule init
git submodule update
echo "**DONE** Did you found the Treasure of Mêlée Island™?"