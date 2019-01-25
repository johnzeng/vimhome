call plug#begin('~/.vim/bundle')
Plug 't9md/vim-choosewin'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'junegunn/fzf', { 'frozen':1, 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' , {'fozen': 1}
Plug 'mhinz/vim-grepper'
Plug 'johnzeng/Smart-deleteion-vim'
Plug 'johnzeng/xml.vim' , {'for': ['xml', 'html']}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp']}
Plug 'luochen1990/rainbow'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim'
Plug 'RRethy/vim-illuminate'
Plug 'skywind3000/vim-preview'
Plug 'previm/previm'
Plug 'johnzeng/vim-mark'
Plug 'inkarkat/vim-ingo-library'

Plug 'danilo-augusto/vim-afterglow'
Plug 'altercation/vim-colors-solarized'                                                  
if has('nvim') && executable('gdb')                                                      
    Plug 'huawenyu/neogdb.vim'                                                           
endif                                                                                    
                                                                                      
if executable('erl')                                                                     
    Plug 'johnzeng/erlang-find-usage.vim', {'for': 'erlang'}                             
    Plug 'johnzeng/vim-erlang-tags' , {'for': 'erlang'}
    Plug 'johnzeng/vim-erlang-omnicomplete' , {'for' : 'erlang'}
    Plug 'johnzeng/vim-erlang', {'for': 'erlang'}
endif
Plug 'posva/vim-vue', {'for': ['javascript']}
Plug 'mbbill/undotree'
if executable('clang-tags')
    Plug 'johnzeng/vim-clang-tags', {'for': ['cpp', 'c']}
endif
Plug 'mhinz/vim-startify'
Plug 'MattesGroeger/vim-bookmarks'

"Plug 'Valloric/YouCompleteMe', {'frozen': 1, 'do': './install.py --all', 'for': [ 
Plug 'johnzeng/YouCompleteMe', {'frozen': 1, 'do': './install.py --all', 'for': [ 
            \ 'erlang', 'java', 'go', 'c', 'cpp', 
            \ 'objc', 'python', 'javascript', 'mysql',
            \ 'scala',  'lua', 'sh']}

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'

if executable('scala')
Plug 'derekwyatt/vim-scala' , { 'for' : 'scala' }
endif
Plug 'plasticboy/vim-markdown' , { 'for' : 'markdown' }
if executable('go')
Plug 'fatih/vim-go' , {'for' : 'go'}
endif
Plug 'Yggdroot/indentLine'

" snipmate and its dependency
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
" snipmat plugin end, all aboves are needed for sinpmate

"Plug 'johnzeng/Scala-Completion-vim'
Plug 'johnzeng/leader-c'
Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'
Plug 'gregsexton/MatchTag'
Plug 'johnzeng/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'artur-shaik/vim-javacomplete2' , {'for' : 'java'}
Plug 'majutsushi/tagbar'

call plug#end()

if has('mac')
    colorscheme afterglow
"    colorscheme solarized
    "TODO should move to a relative path
    let g:erlangWranglerPath='/Users/johnzeng/bin/wrangler'
    let g:comment_key="<M-c>"
"    colorscheme default
"    set background=dark
else
    colorscheme solarized
"    set background=dark
    let g:comment_key="<leader>c"
endif


syntax on
"let $LANG = 'en'
let mapleader = " "
let maplocalleader = " "
set incsearch
set nofsync
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
set noreadonly
set autowriteall
set pvh=1
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"mode is shown by airline
set noshowmode
set tags+=erlang_tags
hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=darkred guifg=white
au BufEnter * set cursorline
au BufLeave * set nocursorline
au BufEnter * set formatoptions-=c formatoptions-=r formatoptions-=o

nmap <C-b> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.gcno','\.gcda', '\.o' ,'\~$']

vmap <C-d> "+y
imap <C-d> <F10><C-r>+<F10>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-a> <Esc>I
imap <C-e> <Esc>A
imap <M-b> <S-Left>
imap <M-f> <S-Right>
"nmap <leader>s <Esc>:wa<CR>
nmap <leader>q <Esc>:wqa<CR>
nmap <leader>Q <Esc>:wqa!<CR>
" we don't use it usually, so we just use a far funcion

command! -nargs=0 HexDump call HexDumpFun()
command! -nargs=0 HexDumpRevert call HexDumpFunRevert()

function! HexDumpFun()
    exec '%!xxd'
endfunc
function! HexDumpFunRevert()
    exec '%!xxd -r'
endfunc

set formatoptions=ql

nmap <leader>r :%s/<C-r>=expand("<cword>")<CR>/
vmap <leader>r :s/<C-r>=expand("<cword>")<CR>/
nmap <leader>h :ccl<CR>
nmap <leader>j :cn<CR>
nmap <leader>k :cp<CR>
nmap <C-n> :Grepper-cword<CR>
nmap <leader>n :Grepper-query<CR>

nmap <leader>x :Commands<CR>
nmap <C-p> :History<CR>
nmap <leader>f :FZF<CR>
nmap <leader>M :Marks<CR>
nmap <leader>l :BLines<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>t :Tags<CR>

imap <C-c> <Esc>:wa<CR>

"imap <M-w> <Esc>:set iskeyword-=_<CR>a<C-w><Esc>:set iskeyword+=_<CR>a
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore deps --ignore '."'.swp'".' -g ""'
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')
let g:fzf_tags_command = 'ctags --fields=+i -n -R -f "c_tags"'

au BufEnter *.pig set filetype=pig

"config for indent
let g:indentLine_enabled = 0

"config for airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='>'
"let g:airline_theme='solarized'
let g:airline_theme='afterglow'


"java complete 2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"let g:EclimCompletionMethod = 'omnifunc'

let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 
let g:html_indent_inctags = "html,body,head"
function! FormatHtml()
  execute "normal ggVGgJ"
  execute "%s/>\s*</>\r</g"
  execute "normal ggVG="
endfunction

au BufEnter *.erl,*.hrl imap <buffer> << <<>><Esc>hi

let g:erlang_tags_auto_update=1
let g:erlang_tags_ignore=['rel']

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
let g:AutoPairsShortcutFastWrap = ""
let g:AutoPairsMoveCharacter = ""
let g:AutoPairsShortcutBackInsert= ""
let g:AutoPairsShortcutToggle = ""
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutJump = ""
let g:AutoPairsMapSpace = 0

" seting about markdown
let g:vim_markdown_folding_disabled = 1
set nofoldenable
set foldmethod=manual

au BufNewFile,BufRead SConstruct set filetype=python
au BufNewFile,BufRead SConscript set filetype=python

" I believe I should split them into different files, but, since they are just begined, let's just do it here
let g:completor_erlang_omni_trigger = '([^. *\t]:\w*)$'
let g:ycm_min_num_of_chars_for_completion = 5
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_global_ycm_extra_conf = '/Users/johnvzeng/working/ycm_extra_conf.py'
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snips"]


let g:ycm_add_preview_to_completeopt = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers =  {
\   'c' : ['->', '.'],
\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
\             're!\[.*\]\s'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : ['rel!\w*:\w*'],
\ }

"let g:ycm_cache_omnifunc = 0

let g:ycm_collect_identifiers_from_comments_and_strings = 1

let g:ycm_collect_identifiers_from_tags_files = 1

let g:erlang_complete_left_bracket = 0
let g:erlang_complete_extend_arbit = 1

command! JsonFormat execute('%!python -m json.tool')


function! AutoReadBuffer(timer)
    if(mode() != 'n')
        return
    endif
    if(expand('%') != '')
        wa
    endif
    checktime
endfunction
call timer_start(5000, 'AutoReadBuffer', {"repeat": -1})

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
nmap <leader>w <C-w>

highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE

"let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

let g:bookmark_no_default_key_mappings = 1
nmap <leader>a <Plug>BookmarkToggle
nmap <leader>A <Plug>BookmarkShowAll
nmap <leader>m <Plug>MarkSet

let g:bookmark_auto_save_file = '.vim-bookmarks'

let g:startify_list_order = [
            \ ['MRU '.getcwd()],
            \ 'dir',
            \ ['Commands:'],
            \ 'commands',
            \ ['MRU'],
            \ 'files',
            \ ['Sessions:'],
            \ 'sessions',
            \ ]

let g:startify_commands = [
            \ {'f': ['FZF', 'FZF']},
            \ {'m': ['Bookmark', 'BookmarkShowAll']},
            \ ]

let g:startify_change_to_dir = 0
set foldmethod=syntax
set foldlevelstart=20

command! -nargs=0 SetDosFormat :ed ++ff=dos %
set ffs=unix,mac,dos

au BufReadPost quickfix setlocal foldmethod=expr
au BufReadPost quickfix setlocal foldlevelstart=0
au BufReadPost quickfix setlocal foldexpr=matchstr(getline(v:lnum),'^[^\|]\\+')==#matchstr(getline(v:lnum+1),'^[^\|]\\+')?1:'<1'
au BufReadPost quickfix map <buffer> <silent> zq zM:g/error:/normal zv<CR>
au BufReadPost quickfix map <buffer> <silent> zw zq:g/warning:/normal zv<CR>
au BufReadPost quickfix map <buffer> <silent> o za

au BufEnter *.erl,*.hrl nmap <buffer> <leader>gs :FindErlangUsage<CR>

let g:rainbow_active = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>e <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>e <Plug>(EasyAlign)

nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)

call expand_region#custom_text_objects('ruby', {
      \ 'im' :0,
      \ 'am' :0
      \ })

call expand_region#custom_text_objects('c', {
      \ 'i}' :1,
      \ 'a}' :1,
      \ 'i(' :1,
      \ 'a(' :1,
      \ 'i[' :1,
      \ 'a[' :1
      \ })

call expand_region#custom_text_objects('cpp', {
      \ 'i}' :1,
      \ 'a}' :1,
      \ 'i(' :1,
      \ 'a(' :1,
      \ 'i<' :1,
      \ 'i>' :1,
      \ 'i[' :1,
      \ 'a[' :1
      \ })

call expand_region#custom_text_objects('erlang', {
      \ 'i(' :1,
      \ 'a(' :1,
      \ 'i{' :1,
      \ 'a{' :1,
      \ 'i[' :1,
      \ 'a[' :1,
      \ 'i<' :1,
      \ 'a<' :1
      \ })

let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }

for i in ['cterm', 'gui']
  for j in ['fg', 'bg']
    let c = synIDattr(hlID('Normal'), 'bg', i)
    if (!empty(c))
      exec 'highlight CarriageReturn ' . i . j . '=' . c
    endif
  endfor
endfor
if hlID('CarriageReturn')
  match CarriageReturn /\r$/
endif

command! SuWrite w !sudo tee "%" > /dev/null
let g:Illuminate_ftblacklist = ['nerdtree', 'qf', 'startify']
hi illuminatedWord ctermfg=180 ctermbg=240
"hi illuminatedWord ctermbg=240
if has("autocmd")                                                          
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        
endif
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd='open -a Google\ Chrome'
set guifont=Menlo\ Regular:h14


" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_plus_nomap = 1

let g:gutentags_add_default_project_roots=0

let g:mark_disable_default_mapping=1 

au BufEnter *.hxx,*.cc,*.c,*.cpp,*.h,*.js,*.cxx,*.hpp,*.objc,*.ojbcpp,*.go,*.py,*.cs nmap <buffer> <leader>] :YcmCompleter GoTo<CR>
au BufEnter *.hxx,*.cc,*.c,*.cpp,*.h,*.js,*.cxx,*.hpp,*.objc,*.ojbcpp,*.go,*.py,*.cs nmap <buffer> <leader>gd :YcmCompleter GoToDefinition<CR>
au BufEnter *.hxx,*.cc,*.c,*.cpp,*.h,*.js,*.cxx,*.hpp,*.objc,*.ojbcpp,*.go,*.py,*.cs nmap <buffer> <leader>gc :YcmCompleter GoToDeclaration<CR>
au BufEnter *.hxx,*.cc,*.c,*.cpp,*.h,*.js,*.cxx,*.hpp,*.objc,*.ojbcpp nmap <buffer> <leader>gi :YcmCompleter GoToInclude<CR>
au BufEnter *.hxx,*.cc,*.c,*.cpp,*.h,*.js,*.cxx,*.hpp,*.objc,*.ojbcpp nmap <buffer> <leader>gf :YcmCompleter FixIt<CR>
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gr :GscopeFind d <C-R><C-W><cr>
let g:mwDefaultHighlightingPalette = 'extended'

autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
nnoremap <silent><buffer> <leader>P :PreviewClose<cr>
autocmd FileType cpp,c nnoremap <silent><buffer> <leader>p :PreviewTag<cr>
