call plug#begin('~/.vim/bundle')
Plug 'johnzeng/vim-erlang'
" let try it and let's see how good it is
Plug 'scrooloose/nerdtree'
Plug 'derekwyatt/vim-scala' , { 'for' : 'scala' }
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown' , { 'for' : 'markdown' }
Plug 'fatih/vim-go' , {'for' : 'go'}
Plug 'Yggdroot/indentLine'
Plug 'justmao945/vim-clang' , {'for' : ['c', 'cpp', 'objc']}
Plug 'johnzeng/VimSessionManager'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'diepm/vim-rest-console'
"Plug 'johnzeng/Scala-Completion-vim'
Plug 'johnzeng/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-omnicomplete' , {'for' : 'erlang'}
Plug 'johnzeng/SimpleGrep'
Plug 'johnzeng/leader-c'
Plug 'vim-airline/vim-airline'

"don't forget to run 'pip install jedi' before you use it.
Plug 'davidhalter/jedi-vim' ,{'for' : 'python'}
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-sneak'
Plug 'gregsexton/MatchTag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'artur-shaik/vim-javacomplete2' , {'for' : 'java'}

call plug#end()

colorscheme elflord
syntax on
set incsearch
set hlsearch
set number
set ruler
set hidden 
set mouse=a
set ts=4
set backspace=2
set shiftwidth=4
set expandtab
"set noexpandtab
set smartindent
set pastetoggle=<F10>
set autoread
au BufEnter * set formatoptions-=c formatoptions-=r formatoptions-=o



nmap <C-b> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.gcno','\.gcda', '\.o' ,'\~$']

vmap <C-e> "+y
imap <C-e> <F10><C-r>+<F10>
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

function! GrepFromInput(...)
  let a:inputword = input("Grep:")
  if strlen(a:inputword) == 0
    return
  endif
  let a:exec_command = "Regrep ".a:inputword." *"
  exec a:exec_command
endfunction

nmap <C-p> :LeaderfMruCwd<CR>
let g:Lf_MruInCurDirOnly= 1
let g:Lf_WildIgnore = {
      \ 'dir': ['.svn','.git','target','node_modules','metastore_db', 'vendor', 'deps', 'rel', 'logs'],
      \ 'file': ['*.DS_Store','*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.log','*.class','*.cache','*.jar', '*.gcno','*.gcda', '*.beam']
      \}
let g:Lf_MruFileExclude = ['*.so','*.log',]

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

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {
        \     "\<CR>": '<Over>(easymotion)'
        \   },
        \   'is_expr': 0
        \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <leader>/  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> <leader>?  incsearch#go(<SID>incsearch_config({'command': '?'}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
        \   'converters': [incsearch#config#fuzzyword#converter()],
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
        \   'is_expr': 0,
        \   'is_stay': 1
        \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

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
"autocmd BufWritePost *.vim so %
nmap <F4> :TagbarToggle<CR>

let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 
let g:html_indent_inctags = "html,body,head"
function! FormatHtml()
  execute "normal ggVGgJ"
  execute "%s/>\s*</>\r</g"
  execute "normal ggVG="
endfunction

"exclude dir for simple grep
let g:grep_exclude_dir=[".git", ".svn", ".tmp", "node_model", "vendor", "log", "logs", "deps", "bin" ]
let g:grep_exclude_file=[".gitignore", "*.beam", "*.o", "*.pyc", "*.swp", "*.zip", "*.rar", "*.dump", "tags", "*.pem"]

au BufEnter *.erl imap <buffer> << <<>><Esc>hi
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}

" seting about markdown
let g:vim_markdown_folding_disabled = 1
set nofoldenable

au BufNewFile,BufRead SConStruct set filetype=python
au BufNewFile,BufRead SConScript set filetype=python

"uncomment this when you need to use meta key or alt key
"for i in range(97,122)
"  let c = nr2char(i)
"  exec "map \e".c." <M-".c.">"
"  exec "map! \e".c." <M-".c.">"
"endfor
