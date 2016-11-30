#!/bin/sh

echo 'Installing johnzeng/vimhome, this script will need vim and git installed'

echo 'After the installation, you can folow the Opitonal for completion to do futher installation'
echo 'now clone the source repo'
git clone https://github.com/johnzeng/vimhome.git ~/.vim
echo 'now clone the vundle'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
echo 'now write the source'
echo "source ~/.vim/plugin/vimrc.vim" > ~/.vimrc
vi -c :BundleInstall
