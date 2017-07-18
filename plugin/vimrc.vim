call plug#begin('~/.vim/bundle')
Plug 'johnzeng/vim-erlang', {'for': 'erlang'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'

if has('nvim')
    Plug 'altercation/vim-colors-solarized'
endif

Plug 'Valloric/YouCompleteMe', {'frozen': 1, 'do': './install.py --all', 'for': [ 
            \ 'vim','erlang', 'java', 'go', 'c', 'cpp', 
            \ 'objc', 'python', 'javascript', 'mysql',
            \ 'scala',  'lua', 'sh']}

Plug 'scrooloose/nerdtree'
Plug 'derekwyatt/vim-scala' , { 'for' : 'scala' }
Plug 'plasticboy/vim-markdown' , { 'for' : 'markdown' }
Plug 'fatih/vim-go' , {'for' : 'go'}
Plug 'Yggdroot/indentLine'

Plug 'tenfyzhong/CompleteParameter.vim', {'branch': 'develop'}

" snipmate and its dependency
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" snipmat plugin end, all aboves are needed for sinpmate

"Plug 'johnzeng/Scala-Completion-vim'
Plug 'johnzeng/vim-erlang-tags' , {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete' , {'for' : 'erlang'}
Plug 'johnzeng/leader-c'
Plug 'vim-airline/vim-airline'

"Plug 'davidhalter/jedi-vim' ,{'for' : 'python'}
Plug 'vim-airline/vim-airline-themes'
Plug 'gregsexton/MatchTag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'artur-shaik/vim-javacomplete2' , {'for' : 'java'}
Plug 'majutsushi/tagbar'

call plug#end()

if has('nvim')
    colorscheme solarized
    set background=dark
else
    colorscheme elflord
endif


syntax on
"let $LANG = 'en'
let mapleader = " "
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
set autowriteall
set pvh=1
au BufEnter * set formatoptions-=c formatoptions-=r formatoptions-=o

if has('mac')
    let g:erlangWranglerPath='/Users/johnzeng/bin/wrangler'
elseif has('unix')
endif

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
nmap <leader>s <Esc>:wa<CR>
nmap <leader>q <Esc>:qa<CR>
nmap <leader>Q <Esc>:qa!<CR>
" we don't use it usually, so we just use a far funcion
nmap <F11> :%!xxd<CR>
nmap <F12> :%!xxd -r<CR>


set formatoptions=ql

nmap <leader>r :%s/<C-r>=expand("<cword>")<CR>/
vmap <leader>r :s/<C-r>=expand("<cword>")<CR>/
nmap <leader>i :bn<CR>
nmap <leader>o :bp<CR>
nmap <leader>j :cn<CR>
nmap <leader>h :ccl<CR>:pclose<CR>
nmap <leader>d "_d
vmap <leader>d "_d
nmap <C-n> :Grepper-cword<CR>
nmap <leader>n :Grepper-query<CR>

nmap <C-p> :History<CR>
nmap <leader>f :FZF<CR>
nmap <leader>l :BLines<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>t :Tags<CR>
imap <M-w> <C-R>=SmartDelete_v2()<CR>
"imap <M-w> <Esc>:set iskeyword-=_<CR>a<C-w><Esc>:set iskeyword+=_<CR>a
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore deps --ignore '."'.swp'".' -g ""'
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

nmap <C-d> :call ListRegAndPaste()<CR>

func! SmartDelete_v2()
    let delete_till = CalDeleteTillForSmartDelete()
    if delete_till == -100
        return "\<C-w>"
    else
        let cur_line = getline('.')
        let cur_col = col('.')
        let curpos = getpos('.')
        let partA = strpart(cur_line, 0, delete_till)
        let partB = strpart(cur_line, cur_col - 1)
        let new_line = partA . partB
        call setline('.', new_line)
        let curpos[2] = delete_till + 1
        call setpos('.', curpos)
        return ""
    end
endfunc

func! CalDeleteTillForSmartDelete()
    let cur_col = col('.')
    let curpos = getpos('.')
    normal b
    let word_head_col = col('.')
    call setpos('.', curpos)
    let cur_line = getline('.')

    "current col is still in input mode, so you should start search from cur_col - 1 col
    "col is not index of cur_line, col - 2 is the index of the cur_col - 1
    let first_upper_case_index = cur_col - 2
    let first_under_score_index = cur_col - 2

    "should not equal the word_head_col's index
    while first_under_score_index >= word_head_col - 1
        if cur_line[first_under_score_index] == '_'
            while first_under_score_index >= word_head_col - 1 && cur_line[first_under_score_index - 1] == '_'
                let first_under_score_index = first_under_score_index - 1
            endwhile
            break
        endif
        let first_under_score_index = first_under_score_index - 1
    endwhile

    "should not equal the word_head_col's index
    if first_under_score_index > word_head_col - 1
        echom first_under_score_index
        if first_under_score_index == cur_col - 2
            let delete_till = first_under_score_index 
        else
            let delete_till = first_under_score_index + 1
        endif
        return delete_till
    endif
        
    "should not equal the word_head_col's index
    while first_upper_case_index >= word_head_col - 1
        if 'A' <= cur_line[first_upper_case_index] && cur_line[first_upper_case_index] <= 'Z'
            while first_upper_case_index >= word_head_col - 1 && 'A' <= cur_line[first_upper_case_index] && cur_line[first_upper_case_index] <= 'Z'
                let first_upper_case_index = first_upper_case_index - 1
            endwhile
            break
        endif
        let first_upper_case_index = first_upper_case_index - 1
    endwhile

    "should not equal the word_head_col's index
    if first_upper_case_index > word_head_col - 1
        let delete_till = first_upper_case_index + 1
        return delete_till
    endif
    return -100
endfunc

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
au BufWritePost *.c,*.cpp,*.h,*.cxx,*.hpp execute ":silent !ctags -R .&"

"config for indent
let g:indentLine_enabled = 0
nmap <F3> :IndentLinesToggle<CR>

"config for airline
let g:airline_left_sep='>'
let g:airline_theme='solarized'

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

autocmd FileType scala nmap <leader>S :SortScalaImports<CR>

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
let g:erlang_tags_auto_update=1
let g:erlang_tags_ignore=['rel']
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
let g:AutoPairsShortcutBackInsert="<M-d>"

" seting about markdown
let g:vim_markdown_folding_disabled = 1
set nofoldenable

au BufNewFile,BufRead SConstruct set filetype=python
au BufNewFile,BufRead SConscript set filetype=python

" I believe I should split them into different files, but, since they are just begined, let's just do it here
let g:completor_erlang_omni_trigger = '([^. *\t]:\w*)$'
let g:python_host_prog= '/usr/local/bin/python'
let g:ycm_server_python_interpreter  = '/usr/local/bin/python'
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
\   'erlang' : [':\w*'],
\ }
let g:ycm_cache_omnifunc = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1

let g:ycm_collect_identifiers_from_tags_files = 1

let g:erlang_complete_left_bracket = 0
let g:erlang_complete_extend_arbit = 1
let g:complete_parameter_mapping_complete = "<c-y>"
let g:complete_parameter_mapping_goto_next = '<m-i>'
let g:complete_parameter_mapping_goto_previous = '<m-u>'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<M-Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

command! JsonFormat execute('%!python -m json.tool')

function! AutoReadBuffer(timer)
    execute ":checktime"
endfunction

call timer_start(5000, 'AutoReadBuffer', {"repeat": -1})

