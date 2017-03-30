call plug#begin('~/.vim/bundle')
Plug 'johnzeng/vim-erlang', {'for': 'erlang'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"ale is so bad 
"Plug 'w0rp/ale', { 'for' : 'erlang' }
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'derekwyatt/vim-scala' , { 'for' : 'scala' }
Plug 'plasticboy/vim-markdown' , { 'for' : 'markdown' }
Plug 'fatih/vim-go' , {'for' : 'go'}
Plug 'Yggdroot/indentLine'
Plug 'justmao945/vim-clang' , {'for' : ['c', 'cpp', 'objc']}

" snipmate and its dependency
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

"Plug 'johnzeng/Scala-Completion-vim'
Plug 'johnzeng/vim-erlang-tags' , {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete' , {'for' : 'erlang'}
Plug 'johnzeng/leader-c'
Plug 'vim-airline/vim-airline'

Plug 'davidhalter/jedi-vim' ,{'for' : 'python'}
Plug 'vim-airline/vim-airline-themes'
Plug 'gregsexton/MatchTag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'artur-shaik/vim-javacomplete2' , {'for' : 'java'}
"Plug 'mattboehm/vim-unstack'

call plug#end()

"colorscheme elflord
set background=dark
colorscheme solarized

syntax on
"let $LANG = 'en'
let mapleader = " "
set incsearch
set so=5
set hlsearch
set number
set ruler
set hidden 
set mouse=a
set ts=4
set backspace=2
set shiftwidth=4
set expandtab
set smartindent
set pastetoggle=<F10>
set autoread
au BufEnter * set formatoptions-=c formatoptions-=r formatoptions-=o



nmap <C-b> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.gcno','\.gcda', '\.o' ,'\~$']

vmap <C-e> "+y
imap <C-e> <F10><C-r>+<F10>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-a> <Home>
imap <C-d> <End>
imap <A-b> <S-Left>
imap <A-f> <S-Right>
nmap <leader>s <Esc>:wa<CR>
nmap <leader>q <Esc>:qa<CR>
" we don't use it usually, so we just use a far funcion
nmap <F11> :%!xxd<CR>
nmap <F12> :%!xxd -r<CR>


set formatoptions=ql

nmap <leader>r :%s/<C-r>=expand("<cword>")<CR>/
vmap <leader>r :s/<C-r>=expand("<cword>")<CR>/
nmap <leader>j :bn<CR>
nmap <leader>k :bp<CR>
nmap <leader>i :tabp<CR>
nmap <leader>o :tabn<CR>
nmap <leader>l :cn<CR>
nmap <leader>h :ccl<CR>
nmap <leader>d "_d
vmap <leader>d "_d
nmap <C-n> :Grepper-cword<CR>
nmap <leader>n :Grepper-query<CR>

nmap <C-p> :History<CR>
nmap <leader>f :FZF<CR>
nmap <C-l> :BLines<CR>
nmap <leader>b :Buffers<CR>
nmap <M-t> :Tags<CR>
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore deps --ignore '."'.swp'".' -g ""'
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

nmap <C-e> :call ListRegAndPaste()<CR>

func! ListRegAndPaste()
  exec "reg 0123456789\""
  let a:regId = input("which reg do you want?[0-9,\"]:")
  if strlen(a:regId) != 0 && -1 == match(a:regId, "[0-9\"]")
    exec "redraw"
    echon 'illegal register id'
    return 
  endif
  exec "set paste"
  exec "normal \"".a:regId."p"
  exec "set nopaste"
endfunc

au BufEnter *.pig set filetype=pig

"config for indent
let g:indentLine_enabled = 0
nmap <F3> :IndentLinesToggle<CR>

"config for airline
let g:airline_left_sep='>'
let g:airline_theme='solarized'

"jedi , just a little better, it's still not working with other define
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>d"
let g:jedi#completions_command = "<C-n>"
let g:jedi#rename_command = "<leader>e"

nmap J :call ListMarksAndJump()<CR>

func! ListMarksAndJump()
  exec "marks"
  let a:markId = input("which mark do you want?[0-9,\"a-zA-Z]:")
  if strlen(a:markId) != 0 && -1 == match(a:markId, "[0-9\"a-zA-Z]")
    exec "redraw"
    echon 'illegal mark id'
    return 
  endif
  exec "normal `".a:markId
endfunc

"java complete 2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"file type setting
autocmd FileType scala nmap <leader>t :SortScalaImports<CR>
autocmd FileType erlang,go,java,python,c,cpp,objc,csharp,scala imap <C-l> <ESC>:pclose<CR>a
autocmd FileType erlang,go,java,python,c,cpp,objc,csharp,scala map <C-l> :pclose<CR>

"auto source
nmap <F4> :TagbarToggle<CR>

let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 
let g:html_indent_inctags = "html,body,head"
function! FormatHtml()
  execute "normal ggVGgJ"
  execute "%s/>\s*</>\r</g"
  execute "normal ggVG="
endfunction

au BufEnter *.erl,*.hrl imap <buffer> << <<>><Esc>hi
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
let g:AutoPairsShortcutBackInsert="<M-d>"

" seting about markdown
let g:vim_markdown_folding_disabled = 1
set nofoldenable

au BufNewFile,BufRead SConstruct set filetype=python
au BufNewFile,BufRead SConscript set filetype=python

let g:deoplete#enable_at_startup = 1

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.erlang = '[^. *\t]:\w*'

"au BufEnter *.erl call CreateAleOpts()

function! CreateAleOpts()
    if exists('g:ale_erlang_erlc_options') && g:ale_erlang_erlc_options != ''
        return 0
    endif
    let $ERL_LIBS='deps:.'
    let alllibs = finddir('lib', '**/', -1)
    for one_lib in alllibs
        let $ERL_LIBS.=':' . one_lib
    endfor 
    let g:ale_erlang_erlc_options = ''
    let allinclude = finddir('include', '**/', -1)
    for path in allinclude
        let g:ale_erlang_erlc_options .= '-I ' . path . ' '
    endfor
endfunction

let g:unstack_mapkey="<leader>u"
command! JsonFormat execute('%!python -m json.tool')
