#!/bin/sh

echo 'Installing johnzeng/vimhome, this script will need vim and git installed'

echo 'After the installation, you can folow the Opitonal for completion to do futher installation'
echo 'now clone the source repo'
git clone https://github.com/johnzeng/vimhome.git ~/.vim
echo 'now install plug-vim'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'now write the source'
echo "source ~/.vim/plugin/vimrc.vim" >> ~/.vimrc
echo 'now add some scripte command'
echo "alias erltag='sh ~/.vim/auto_erlang_tag_hook.sh'" >> ~/.bash_profile
echo "now install plguins from vim"
vi -c :BundleInstall
