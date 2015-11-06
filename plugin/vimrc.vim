set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Yggdroot/LeaderF'
Plugin 'scrooloose/nerdtree'
Plugin 'johnzeng/snipmate.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'rizzatti/dash.vim'

call vundle#end()
filetype plugin indent on

syntax on
set incsearch
set hlsearch
set number
set ruler
"set mouse=a
set ts=4
set expandtab
set shiftwidth=4
set cindent
set pastetoggle=<leader>p
nmap <C-p> :LeaderfMru<CR>
nmap <C-b> :NERDTree<CR>
nmap <leader>s <Esc>:wa<CR>a
nmap <F2> :mksession!<CR>:wa<CR>:qa<CR>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
set formatoptions=ql

"nmap <C-n> :vimgrep/<C-r>=expand("<cword>")<CR>/gj **/*.{cpp,h} <CR>:copen<CR>
nmap <silent><C-n> mA:grep --exclude-dir=node_modules -IR '<C-r>=expand("<cword>")<CR>' ./*<CR><CR>`A:cw<CR>
"<CR> <CR>:copen<CR>
nmap <leader>j :bn<CR>
nmap <leader>k :bp<CR>

function! CommentTrigger(...) 
	let a:comment_word="\\/\\/"
	if a:0 >= 1
		let a:comment_word=a:1
    else
        let a:curFileType = &filetype
        if 1 == has_key(g:comment_map,a:curFileType)
            let a:comment_word=g:comment_map[a:curFileType]
        endif
	endif
"now comment

	let a:curLine = getline('.')

	if 0 == match(a:curLine, a:comment_word)
		let a:exec_command = "s\/^".a:comment_word."\/"
	else
		let a:exec_command = "s\/^\/".a:comment_word."/"
	endif

	exec a:exec_command
endfunction

let g:comment_map={'vim': '"', 'sh': '#','python': '#'}

nmap <leader>c :call CommentTrigger()<CR>$
vmap <leader>c :call CommentTrigger()<CR>$
imap <leader>c <Esc>ma:call CommentTrigger()<CR>`a

let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','target'],
        \ 'file': ['*.DS_Store','*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.log','*.class','*.cache']
        \}
let g:Lf_MruFileExclude = ['*.so','*.log',]
