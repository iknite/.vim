# Installation:
	 curl https://raw.github.com/iknite/vimconfig/master/install.sh | sh

This will make the same than the manual install
# Manual Install:
	 rm -rf ~/.vim ~/.vimrc ~/.gvimrc
	 #osx vim
	 brew install macvim --override-system-vim
	 #linux vim
	 sudo apt-get install vim-gnome ruby-dev 

	 git clone git://github.com/iknite/vimconfig.git ~/.vim
	 ln -s ~/.vim/vimrc ~/.vimrc
	 ln -s ~/.vim/gvimrc ~/.gvimrc
	 cd ~/.vim
	 git submodule init
	 git submodule update


	 # Command-T inicialization
	 cd ~/.vim/bundle/command-t/ruby/command-t/
	 ruby extconf.rb
	 make

	 #enjoy
----
iknite @ 2013
v0.6

