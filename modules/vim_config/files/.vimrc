" set 256 color terminal
set term=screen-256color

" load vim-plug
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'haya14busa/incsearch.vim'
Plug 'Shougo/neocomplcache.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tlib_vim'
Plug 'chrisbra/unicode.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'bling/vim-airline'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'aquach/vim-http-client'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'ciaranm/detectindent'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'ivalkeen/nerdtree-execute'
Plug 'tmhedberg/matchit'

" Add plugins to &runtimepath
call plug#end()

" use line numbers
set number

" change <Leader> key from \ to ,
let mapleader = ","

" load theme
colorscheme xoria256

" specify dark background (for plugins that don't read it properly from theme)
set background=dark

" set font
set guifont=Monaco:h12

" enable statusline
set laststatus=2

" define a 'remove trailing whitespace' function:
fun! <SID>TrimWhiteSpace()
  " Don't strip on these filetypes
  if &ft =~ 'markdown\|mkd\|vmail'
    return
  endif
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

"remove trailing whitespace on file save:
augroup trimWhitespace
  autocmd BufWritePre * :call <SID>TrimWhiteSpace()
augroup END

" enable mouse in terminal mode
set mouse=a
set ttym=xterm2

" check for external file changes
au CursorMoved * checktime
au CursorMovedI * checktime

" enable auto-complete on startup
let g:neocomplcache_enable_at_startup = 1

" auto-complete <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" auto-complete <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" use ,p to do fuzzy filename search
map <Leader>p :CtrlP<Enter>

" make ctrlP open files on new tab
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-t>'],
      \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
      \ }

" make ctrlP ignore files specified on .gitignore
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

" show hidden files on NERDTree
let NERDTreeShowHidden=1

" use old folder markers (avoids issues with some terminals)
let g:NERDTreeDirArrows=0

" use ,n to toggle nerdtreetabs
map <Leader>n :NERDTreeToggle<Enter>

" use ,r to open current file on NERDTree
map <leader>r :NERDTreeFind<cr>

" use ,t to create a new tab
map <leader>t :tabnew<Enter>

" use gr to go to previous tab
map gr :tabp<Enter>

" yank and paste with the system clipboard

    " linux
    set clipboard=unnamedplus

    " mac os
    if system("uname") == "Darwin\n"
      set clipboard=unnamed
    endif

" use ENTER to add new lines without going into insert mode
map <CR> o<Esc>k

" Start recording keystrokes by typing qq.
" End recording with q (first press Escape if you are in insert mode).
" Play the recorded keystrokes by hitting space.
:nnoremap <Space> @q

" detect utf-8
if has("multi_byte")
  set encoding=utf-8                     " better default than latin1
  setglobal fileencoding=utf-8           " change default file encoding when writing new files
  set termencoding=utf-8
endif

" use F8 to move tab left
map <F8> :execute "tabmove" tabpagenr() - 2 <CR>

" use F9 to move tab right
map <F9> :execute "tabmove" tabpagenr() + 1 <CR>

" make sure wrap is not turned off by vimdiff
au VimEnter * if &diff | execute 'windo set wrap' | endif

" force fugitive diff to use vertical split
set diffopt=filler,vertical

" set filetypes for common extensions
au BufNewFile,BufRead *.pp set filetype=ruby
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead *.jbuilder set filetype=ruby

" disable markdown folding
let g:vim_markdown_folding_disabled=1

" remap U to real undo
map U :later<Enter>

" use , + direction to switch between splits
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" enable Matchit macro
runtime macros/matchit.vim

" allow matchit to navigate quickly to ending tag in xml/html files
autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType xhtml let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType xml let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType eco let b:match_words = '<\(\w\w*\):</\1,{:}'

" highlight all matches
set hlsearch

" highlight matches when jumping to next
nnoremap <silent> n   n:call HLNext(0.3)<cr>
nnoremap <silent> N   N:call HLNext(0.3)<cr>

function! HLNext (blinktime)
    highlight BlackOnBlack ctermfg=black ctermbg=black
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let hide_pat = '\%<'.lnum.'l.'
            \ . '\|'
            \ . '\%'.lnum.'l\%<'.col.'v.'
            \ . '\|'
            \ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
            \ . '\|'
            \ . '\%>'.lnum.'l.'
    let ring = matchadd('BlackOnBlack', hide_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" remap semicolon to colon (no need to use Shift + ;)
nnoremap ; :

" incsearch mapping
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" set secure mode for reading .vimrc
set secure

" read .vimrc or .exrc on the current directory
set exrc

" ruler line
set colorcolumn=80

" display tabs and trailing spaces
set listchars=tab:>-,trail:~
set list

" change color for tabs and trailing spaces
hi SpecialKey ctermfg=66 guifg=#649A9A

" highlight current line
set cursorline

" syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pylama']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers=['coffeelint']

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" by default, don't highlight anything
match none

" define a 'highlight leading tabs' function:
function! HighlightTabs()
  highlight UnwantedChars ctermbg=darkgreen guibg=darkgreen
  match UnwantedChars /^\t\+/ " leading tabs are unwanted
endfunction

" define a 'highlight leading and trailing whitespace' function:
function! HighlightSpaces()
  highlight UnwantedChars ctermbg=darkgreen guibg=darkgreen
  match UnwantedChars /^\s* \s*\|\s\+$/ " leading and trailing whitespace is unwanted
endfunction

" use ,ht to highlight leading tabs
map <Leader>ht :call HighlightTabs()<CR>

" use ,hs to highlight leading spaces
map <Leader>hs :call HighlightSpaces()<CR>

" prefer 'expandtab' to 'noexpandtab' when no detection is possible
:let g:detectindent_preferred_expandtab = 1

" specify a preferred indent level when no detection is possible
:let g:detectindent_preferred_indent = 2

" run detect indent when starting to edit a new buffer
augroup detectIndentOnOpen
  autocmd BufReadPost * :DetectIndent
augroup END

" how many columns a tab counts for
"set tabstop=2

" how many columns text is indented with the reindent operations (<< and >>)
"set shiftwidth=2

" amount of columns vim uses when you hit Tab in insert mode
"set softtabstop=2

" convert tabs to spaces
"set expandtab

" don't create backup files
set nobackup
set nowritebackup

" save backup files to a custom directory
" set backupdir=~/.vim/backup
