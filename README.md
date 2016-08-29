# Vim-Setting Collection

This is my vim setting colleciton, it's make for OSX , so I am not sure if it can work on windows. I tried it on linux, it works well for most of time.

Some of these settings may need a vim version large than 7.4 with pyhton2 support, if you are using native vim on Mac OSX, you may need to install a new one by `brew`

# Setting up
- clone this repo into ~/.vim
- install vundle into  ~/.vim/bundle/vundle
- run this shell command : `echo "source ~/.vim/plugin/vimrc.vim" > ~/.vimrc`
- re-start a vim and run `:BundleInstall`

# Optional for completion
If you need to do **pyhotn completion**, please install jedi, which is needed by jedi-vim

```
pip install jedi
```

If you need to use **c family completion**, please install clang compiler by yourself. I believe it's not that hard, you will also need to create a `.clang` file under your working dir to specify some pre-compile options. Here are some command you may use to install clang:
```
#For mac brew user
brew install clang
#For debain/ubuntu user
apt install clang
#for centos/redhat user
yum install clang
```
🙃YYes, I haven't tested any one of the above commands, just wanna remind you that you need to install a clang to make it work.
What, you use gcc? Drop it , trust me.

If you need to use **golang completion**, please run  the following command in vim after you have finished installing all package

```
:GoInstallBinaries
```

# custom keyboard mapping that is different from official plugin
- For all completion plugin I use `<C-n>` to trigger completion list (But I still recommand that you use `<C-p>` and `<C-n>`  to do completion, that is more vim style)
- `<C-p>` to open LeaderMru in normal mode
- `<C-b>` to troggle nertree
- `<C-n>` to grep the key word under course
- `<leader>n` to grep a key word


# included plugins
Please read to plugin/vimrc.vim, you can see all plugins there, you can get help from their doc file or github repo
