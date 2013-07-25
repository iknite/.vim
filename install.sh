# I'm trying to simplify installation process D.R.Y!

git=`which git 2>&1`
if [ $? -ne 0 ]; then
	echo "Please install `git` before continue :-("
	exit 1
fi

gvim=`which gvim 2>&1`
if [ $? -ne 0 ]; then
	echo "Installing GVIM"
	case $( uname -s ) in
		Linux) sudo apt-get install vim-gnome ruby-dev;;

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
git clone git://github.com/iknite/vimconfig.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
cd ~/.vim/bundle/command-t/ruby/command-t/
ruby extconf.rb
make
echo "**DONE** Did you found the Treasure of Mêlée Island™?"
