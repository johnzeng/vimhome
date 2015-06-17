set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Yggdroot/LeaderF'
Plugin 'scrooloose/nerdtree'
Plugin 'johnzeng/snipmate.vim'

call vundle#end()
filetype plugin indent on

syntax on
set incsearch
set hlsearch
set number
set ruler
set mouse=a
set ts=4
set noexpandtab
set shiftwidth=4
set cindent

nmap <C-p> :LeaderfMru<CR>
nmap <C-b> :NERDTree<CR>
nmap <F2> :mksession!<CR>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
set formatoptions=ql

"nmap <C-n> :vimgrep/<C-r>=expand("<cword>")<CR>/gj **/*.{cpp,h} <CR>:copen<CR>
nmap <silent><C-n> :grep -IR '<C-r>=expand("<cword>")<CR>' ./*<CR>
"<CR> <CR>:copen<CR>
nmap <leader>j :bn<CR>
nmap <leader>k :bp<CR>

function! CommentTrigger(...) 
	let a:comment_word="\\/\\/"
	if a:0 >= 1
		let a:comment_word=a:1
	endif
	let a:curLine = getline('.')

	if 0 == match(a:curLine, a:comment_word)
		let a:exec_command = "s\/^".a:comment_word."\/"
	else
		let a:exec_command = "s\/^\/".a:comment_word."/"
	endif

	exec a:exec_command
endfunction

nmap <leader>c :call CommentTrigger()<CR>
vmap <leader>c :call CommentTrigger()<CR>

