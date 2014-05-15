#!/usr/bin/env bash
# -*- coding: utf-8 -*-

git=`which git 2>&1`
if [ $? -ne 0 ]; then
	echo "Please install git before continue :-("
	exit 1
fi


case $( uname -s ) in
	Linux) sudo apt-get -y install vim-nox exuberant-ctags;;

	Darwin) 
		brew=`which brew 2>&1`
		if [ $? -ne 0 ]; then
			echo 'Please install brew before continue :-('
			exit 1
		fi
		brew install macvim --override-system-vim
		brew install ctags-exuberant
	;;

	*) echo 'Unsupported system install'; exit 1;;
esac

echo "Installing vim config"
rm -rf ~/.vim ~/.vimrc /.gvimrc
git clone https://github.com/iknite/.vim.git

ln -s ~/.vim/.vimrc ~/.vimrc

cd ~/.vim && 
	git submodule update --init --recursive &&
	vim +BundleInstall +qall

cd ~/.vim/bundle/command-t/ruby/command-t/ &&
	ruby extconf.rb
	make

echo "**DONE** Did you found the Treasure of Mêlée Island™?"
