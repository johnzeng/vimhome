set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Bundle 'gmarik/vundle'
Plugin 'Yggdroot/LeaderF'
Plugin 'scrooloose/nerdtree'
Plugin 'johnzeng/snipmate.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'rizzatti/dash.vim'
Plugin 'yegappan/grep'

"Plugin 'jiangmiao/auto-pairs'
"Plugin 'tenfyzhong/file_template.vim'

call vundle#end()
filetype plugin indent on

syntax on
set incsearch
set hlsearch
set number
set ruler
"set mouse=a
set ts=2
set expandtab
set shiftwidth=2
set cindent
set pastetoggle=<leader>p

nmap <C-p> :LeaderfMru<CR>
nmap <C-b> :NERDTreeToggle<CR>
nmap <leader>s <Esc>:wa<CR>a
nmap <F2> :wa<CR>:mksession!<CR>
imap <C-e> <Esc>
vmap <C-e> <Esc>
" we don't use it usually, so we just use a far funcion
nmap <F11> :%!xxd<CR>
nmap <F12> :%!xxd -r<CR>


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
set formatoptions=ql

"nmap <C-n> :vimgrep/<C-r>=expand("<cword>")<CR>/gj **/*.{cpp,h} <CR>:copen<CR>
nmap <silent><C-n> mA:grep --exclude-dir=target --exclude-dir=node_modules -IR '<C-r>=expand("<cword>")<CR>' ./*<CR><CR>`A:cw<CR>
nmap <silent><leader>n mA:call GrepFromInput()<CR>
nmap <leader>r :%s/<C-r>=expand("<cword>")<CR>/
vmap <leader>r :s/<C-r>=expand("<cword>")<CR>/
nmap <leader>j :bn<CR>
nmap <leader>k :bp<CR>

function! GrepFromInput(...)
    let a:inputword = input("Grep:")
    if strlen(a:inputword) == 0
        return
    endif
    let a:exec_command = "grep --exclude-dir=node_modules --exclude-dir=target -IR '".a:inputword."' ./*"
    exec a:exec_command
	exec 'cw'
endfunction

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

let g:comment_map={'vim': '"', 'sh': '#','python': '#','yaml': '#','conf':'#'}

nmap <leader>c :call CommentTrigger()<CR>$
vmap <leader>c :call CommentTrigger()<CR>$
imap <leader>c <Esc>ma:call CommentTrigger()<CR>`a

let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','target','node_modules'],
        \ 'file': ['*.DS_Store','*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.log','*.class','*.cache','*.jar']
        \}
let g:Lf_MruFileExclude = ['*.so','*.log',]
"I think I can do something on this so I can set cache for every project
"let g:Lf_CacheDiretory = '~/cloud_lucifer/'
autocmd VimLeave * :call SaveSession()

let g:LessSaveBufNum = 5
function! SaveSession()
    if filereadable("Session.vim")
        let a:bufNum = bufnr('$')
        "" save session only when buff num more then 5
        if a:bufNum > g:LessSaveBufNum
            exec "mksession!"
        end
    end
endfunction


"config about grep
let Grep_Skip_Files = '*.bak *~' 
let Grep_Default_Options = '--exclude-dir=node_modules --exclude-dir=target -IR'
let Grep_Skip_Dirs = 'project'

"seting for scala
au FileType scala nmap <leader>s :SortScalaImports
