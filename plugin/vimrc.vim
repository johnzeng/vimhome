set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Bundle 'gmarik/vundle'
Plugin 'Yggdroot/LeaderF'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
"Plugin 'rizzatti/dash.vim'
Plugin 'yegappan/grep'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

"Plugin 'Yggdroot/indentLine'
Plugin 'johnzeng/snipmate.vim'
Plugin 'johnzeng/leader-c'

call vundle#end()
filetype plugin indent on

colorscheme elflord
syntax on
set incsearch
set hlsearch
set number
set ruler
set hidden 
set backspace=2
set mouse=a
set ts=2
set expandtab
set shiftwidth=2
set cindent
set pastetoggle=<leader>p
set autoread

nmap <C-p> :LeaderfMru<CR>

nmap <C-b> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.gcno','\.gcda', "\.o" ,'\~$']

vmap <C-e> "+y
imap <C-e> \p<C-r>+\p
nmap <leader>s <Esc>:wa<CR>
nmap <leader>q <Esc>:qa<CR>
nmap <F2> :wa<CR>:mksession!<CR>
" we don't use it usually, so we just use a far funcion
nmap <F11> :%!xxd<CR>
nmap <F12> :%!xxd -r<CR>


set formatoptions=ql

nmap <silent><C-n> :Grep '<C-r>=expand("<cword>")<CR>' *<CR>
nmap <silent><leader>n mA:call GrepFromInput()<CR>
nmap <leader>r :%s/<C-r>=expand("<cword>")<CR>/
vmap <leader>r :s/<C-r>=expand("<cword>")<CR>/
nmap <leader>j :bn<CR>
nmap <leader>k :bp<CR>
nmap <leader>l :cn<CR>
nmap <leader>h :ccl<CR>
nmap <leader>d "_d
vmap <leader>d "_d

function! GrepFromInput(...)
    let a:inputword = input("Grep:")
    if strlen(a:inputword) == 0
        return
    endif
    let a:exec_command = "Grep '".a:inputword."' *"
    exec a:exec_command
endfunction

let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','target','node_modules'],
        \ 'file': ['*.DS_Store','*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.log','*.class','*.cache','*.jar', '*.gcno','*.gcda']
        \}
let g:Lf_MruFileExclude = ['*.so','*.log',]
"I think I can do something on this so I can set cache for every project
"let g:Lf_CacheDiretory = '~/cloud_lucifer/'

function! LoadSession()
  if filereadable("Session.vim")
    let a:bufNum = bufnr('$')
    if a:bufNum == 1 && bufname(1) == ""
      exec "source Session.vim\n"
    endif
  endif
endfunction

autocmd BufEnter * :call LoadSession()
autocmd VimLeave * :call SaveSession()

let g:LessSaveBufNum = 5
function! SaveSession()
    if filereadable("Session.vim")
        let a:bufNum = bufnr('$')
        "" save session only when buff num more then 5
        if a:bufNum > g:LessSaveBufNum 
            exec "NERDTreeClose"
            exec "mksession!"
        end
    end
endfunction

"config about grep
let Grep_Skip_Files = '*.bak *~ *.o *.jar *.class *.log, *.scala' 
let Grep_Default_Options = '--exclude-dir=node_modules --exclude-dir=target -IR'
let Grep_Skip_Dirs = 'project'
