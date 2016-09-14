# Vim-Setting Collection

This is my vim setting colleciton, it's make for OSX , so I am not sure if it can work on windows. I tried it on linux, it works well for most of time.

Some of these settings may need a vim version large than 7.4 with pyhton2 support, if you are using native vim on Mac OSX, you may need to install a new one by `brew`

# Setting up
- clone this repo into ~/.vim
- install vundle into  ~/.vim/bundle/vundle
- run this shell command : `echo "source ~/.vim/plugin/vimrc.vim" > ~/.vimrc`
- re-start a vim and run `:BundleInstall`

# included plugins
Please read to plugin/vimrc.vim, you can see all plugins there, you can get help from their doc file or github repo, you should learn the key mapping at first.Some of the frequently used plugins are:
- vim-airline
- vim-go
- vim-scala
- leaderf
- nerdtree
- grep
- leader-c
- vim-surround
- auto-pairs
You should learn to use leaderf , nerdtree and grep at first, with them you can work in most of situation

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

🙃Yes, I haven't tested any one of the above commands, just wanna remind you that you need to install a clang to make it work.
What, you use gcc? Drop it , trust me.

If you need to use **golang completion**, please run  the following command in vim after you have finished installing all package

```
:GoInstallBinaries
```

If you need to use **java completion**, you may suffer from long latency when you open a `.java` at first time, don't worry, it won't take such long latency the next time. Maybe you will need a `javac` to compile some jar file that the script needed.


# custom keyboard mapping that is different from official plugin
- For all completion plugin I use `<C-o>` to trigger completion list .But I still recommand that you use `<C-p>` and `<C-n>`  to do most of your completion, that is faster and more vim style.
- `<C-p>` to open LeaderMru in normal mode
- `<C-b>` to troggle nertree
- `<C-n>` to grep the key word under course
- `<leader>n` to grep a key word
- `<F3>` to toggle the indent line


# custom feature that you may need to know
- auto reload a vim script after saving it if you are editing a `.vim` file.
- `<leader>r` to open a `:%s/[word under cursor]/` command
- `<leader>q` to quit vim
- `<leader>s` to save all files you have opened
- `<leader>j` and `<leader>k` to move to next buffer or previous buffer
- `<C-e>` in normal mode to open a register list and then input any id so you can paste the content in the register into your buffer
- `<C-e>` in virsual mode to copy from vim to system clipboard (need clipboard feature support, read `:help clipboard` for more info)
- `<C-e>` in insert mode to paste to vim from system clipboard (need clipboard feature support, read `:help clipboard` for more info)
- `<C-l>` in insert mode or normal mode to close preview window
- J (Shift + j)in normal mode to show all bookmarks and input a key for it to jump to it.
- `<leader>d` to begin a delete that will cut to black whole register (like `<leader>dd` will delete a line, and you won't get it again even if you us `p` command)
- `<F11>` to trans content in vim to binary viewer (if you press multiple time, it will trans the binary code to the "binary code 's binary code", intersting ha?)
- `<F12>` to turn the binary veiw back(same as F11, pressing multiple time will do some strange thing)
- `<F2>` to save a session in the current directory
- `<F4>` Toggle the tagbar (this will need ctags support, and it must be exuberant ctags🙃)
