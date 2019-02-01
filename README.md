# Vim-Setting Collection

This is my vim setting colleciton, it's make for OSX , so I am not sure if it can work on windows. I tried it on linux, it works well for most of time.

Some of these settings may need a vim version large than 7.4 with pyhton2 support, if you are using native vim on Mac OSX, you may need to install a new one by `brew`

# Supporting language

- erlang
- c/cpp/ojbc
- golang
- java
- markdown
- python
- scala
- shell
- xml

# install by one command

**The installation will take a long time to run :BundleInstall in vi, if you get stuck at the last step, you can just reopen a vim and re-run `:BundleInstall`**

via wget

`sh -c "$(wget https://raw.githubusercontent.com/johnzeng/vimhome/master/install.sh -O -)"`

via curl

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/johnzeng/vimhome/master/install.sh)"`

# pre-request
This plugin set is using [ ag ](https://github.com/ggreer/the_silver_searcher) as fuzzy finder source, so you may need to install it by yourself. Trust me, this is amazing.

# included plugins
Please read to [vimrc](plugin/vimrc.vim), you can see all plugins there, you can get help from their doc file or git readme file so you will know how to use them, Some of the frequently used plugins are:

- vim-airline
- fzf
- nerdtree
- grepper
- leader-c
- vim-surround
- auto-pairs

....

You can start from `fzf`, nerdtree and grep at first, with them you can work in most of situation

# Optional post installation

## python completion
If you need to do **pyhotn completion**, please install jedi, which is needed by [ jedi-vim ](https://github.com/davidhalter/jedi-vim)

```
pip install jedi
```

## cpp reference searching

You can use clang-tags to source the cpp reference, check it out [here](https://github.com/johnzeng/clang-tags)

## go completion
If you need to use **golang completion**, please run  the following command provided by [vim-go](https://github.com/fatih/vim-go) in vim after you have finished installing all package

```
:GoInstallBinaries
```

## java completion
If you need to use **java completion**, you may suffer from long latency when you open a `.java` at first time, don't worry, it won't take such long latency the next time. Maybe you will need a `javac` to compile some jar file needed by [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2).

## erlang completion
If you need to use **erlang completion** , you may need to have escript excutable file in your $PATH , which means that you need to install erlang locally so you can have [erlang-completion](https://github.com/vim-erlang/vim-erlang-omnicomplete).

## erlang refactoring

Refer to the readme in [vim-erlang](https://github.com/johnzeng/vim-erlang) , you will  need to set up wrangler and host name to make the plugin work

also, you should define the path for wrangler:

```
let g:erlangWranglerPath='/Users/johnzeng/bin/wrangler'
```

# custom keyboard mapping that is different from official plugin
- For all completion plugin I use `<C-o>` to trigger completion list .But I still recommand that you use `<C-p>` and `<C-n>`  to do most of your completion, that is faster and more vim style.
- `<leader>` key is ` <space> ` instead of `\ ` 
- `<C-b>` to troggle nertree
- `<C-n>` to grep the key word under course
- `<leader>n` to grep a key word
- `<F3>` to toggle the indent line


# custom feature that you may need to know
- auto save file.
- undo history. You can undo it even after you reopen a file
- `<A-w>` in insert mode to use smart delete, this allows you to delete a word until under score or uppper case. Try it out.
- `<leader>f` to open a fzf (fuzzy finder)
- `<leader>b` to open a buff searcher
- `<c-p>` to open a fuuzy history searcher
- `<leader>q` to quit vim
- `<leader>j` and `<leader>k` to move to next buffer or previous buffer
- `<C-e>` in normal mode to open a register list and then input any id so you can paste the content in the register into your buffer
- `<C-e>` in virsual mode to copy from vim to system clipboard (need clipboard feature support, read `:help clipboard` for more info)
- `<C-e>` in insert mode to paste to vim from system clipboard (need clipboard feature support, read `:help clipboard` for more info)
- `<C-l>` in insert mode or normal mode to close preview window
- J (Shift + j)in normal mode to show all bookmarks and input a key for it to jump to it.
- `<leader>d` to begin a delete that will cut to black whole register (like `<leader>dd` will delete a line, and you won't get it again even if you us `p` command)
- `<F2>` to save a session in the current directory
- `<F4>` Toggle the tagbar (this will need ctags support, and it must be exuberant ctags🙃)

# python support

If you are using nvim, or ycm , you may need to set up python program in your `.vimrc` file like this:

```
let g:python3_host_prog = "/usr/local/bin/python3"
let g:python_host_prog = "/usr/local/bin/python"
let g:ycm_server_python_interpreter = "/usr/bin/python"
```

**the python path need to fix with your own system, please use `which python3` or `which python` to check it out**

