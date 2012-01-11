# Installation:
> git clone git://github.com/iknite/vimconfig.git ~/.vim

# Create symlinks:
> ln -s ~/.vim/vimrc ~/.vimrc
> ln -s ~/.vim/gvimrc ~/.gvimrc

# Switch to the `~/.vim` directory, and fetch submodules:
> cd ~/.vim
> git submodule init
> git submodule update

# OSX: 
## Create the proper macVim terminal installation (requires macport):
> sudo port install macvim +python +ruby
## alias for pleasure in ~/.profile: 
> alias vim="mvim -v"
## plugins 
### Command-t (pathogen approach)
> cd ~/.vim/bundle/command-t/ruby/command-t/
> rake make
### Javascriptlint.vim
Install from http://www.javascriptlint.com/download.htm
> sudo cp ~/Downloads/jsl-0.3.0-mac/jsl /opt/local/bin
> jsl -help:conf > ~/.vim/jsl.conf
> jsl -conf ~/.vim/jsl.conf
Edit the flags you need to comfort, but keep in mind the pitfalls :)

# Ubuntu: 
## grafical version
> sudo apt-get install vim-gnome
## plugins
### Command-t
> sudo apt-get install ruby-dev
> cd ~/.vim/bundle/command-t/ruby/command-t/
> rake make
### JavaScriptLint
Install from http://www.javascriptlint.com/download.htm
> cd ~/Downloads/jsl-0.3.0/src
> make -f Makefile.ref BUILD_OPT=1 
> sudo cp ./Linux_All_DBG.OBJ/jsl /usr/bin  
> jsl -help:conf > ~/.vim/jsl.conf
> jsl -conf ~/.vim/jsl.conf
Edit the flags you need to comfort, but keep in mind the pitfalls :)

----
Enrique 'iknite' Paredes @ 2012
v3.0

