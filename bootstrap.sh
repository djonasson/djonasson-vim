#!/bin/env sh

endpath="$HOME/.djonasson-vim"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

# Backup existing .vim stuff
echo "Backing up current vim config\n"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/$endpath; do [ -e $i ] && mv $i $i.$today; done

echo "cloning djonasson-vim\n"
git clone git://github.com/djonasson/djonasson-vim.git $endpath
mkdir -p $endpath/.vim/bundle
ln -s $endpath/vimrc $HOME/.vimrc
ln -s $endpath/gvimrc $HOME/.gvimrc
ln -s $endpath/ $HOME/.vim

echo "Installing Vundle\n"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "installing plugins using Vundle\n"
vim +BundleInstall! +BundleClean +q
