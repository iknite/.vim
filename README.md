# Installation:
	 git clone git://github.com/iknite/vimconfig.git ~/.vim
	 ln -s ~/.vim/vimrc ~/.vimrc
	 ln -s ~/.vim/gvimrc ~/.gvimrc
	 cd ~/.vim
	 git submodule init
	 git submodule update

## Create the proper macVim terminal installation (requires macport):
	 sudo port install macvim +python +ruby #osx-only
	 sudo apt-get install vim-gnome ruby-dev #linux-only 
## alias for pleasure in ~/.profile: 
	 alias vim="mvim -v"
	 alias gvim="mvim"
## plugins 
### Command-t (pathogen approach)
	 cd ~/.vim/bundle/command-t/ruby/command-t/
	 ruby extconf.rb
	 make
----
iknite @ 2013
v0.5

