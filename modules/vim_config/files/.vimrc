" set 256 color terminal
set term=screen-256color

" load vim-plug
call plug#begin('~/.vim/plugged')

" fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" editorconfig.org support
Plug 'editorconfig/editorconfig-vim'

" auto-completion
Plug 'Shougo/neocomplete.vim'

" easy comment/uncomment
Plug 'scrooloose/nerdcommenter'

" file explorer
Plug 'scrooloose/nerdtree'

" syntax checking
Plug 'scrooloose/syntastic'

" lean & mean status/tabline
Plug 'bling/vim-airline'

" easily align text
Plug 'junegunn/vim-easy-align'

" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" visually display indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

" language pack
Plug 'sheerun/vim-polyglot'

" automatically detect indent settings
Plug 'tpope/vim-sleuth'

" extended % matching for HTML, LaTeX, and many other languages
Plug 'tmhedberg/matchit'

" hande unicode and digraphs characters
Plug 'chrisbra/unicode.vim'

" utility functions
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" Add plugins to &runtimepath
call plug#end()

" use line numbers
set number

" change <Leader> key from \ to ,
let mapleader = ","

" make j & k move up/down a single row in the screen (not on a linewise basis)
nnoremap j gj
nnoremap k gk

" load theme
colorscheme xoria256

" specify dark background (for plugins that don't read it properly from theme)
set background=dark

" set font
set guifont=Monaco:h12

" enable statusline
set laststatus=2

" make search case-insensitive except when you include upper-case characters
set ignorecase
set smartcase

" highlight search as you type
set incsearch

" highlight all matches when doing search (not just the next one)
set hlsearch

" use \ to clear highlight after a search
nmap \ :nohlsearch<CR>

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

" remove trailing whitespace on file save:
augroup trimWhitespace
  autocmd BufWritePre * :call <SID>TrimWhiteSpace()
augroup END

" enable mouse in terminal mode
set mouse=a
set ttym=xterm2

" check for external file changes
au CursorMoved * checktime
au CursorMovedI * checktime

" disable AutoComplPop.
let g:acp_enableAtStartup = 0

" enable auto-complete on startup
let g:neocomplete#enable_at_startup = 1

" auto-complete use smartcase
let g:neocomplete#enable_smart_case = 1

" auto-complete <CR> completion.
inoremap <expr><CR>  pumvisible() ? "\<C-n>" : "\<CR>"

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

" remap semicolon to colon (no need to use Shift + ;)
nnoremap ; :

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

" define a function to easily change indent size
function! IndentSize(len)
  execute "set tabstop =".a:len
  execute "set shiftwidth =".a:len
  execute "set softtabstop =".a:len
endfunction

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
set noswapfile

" save backup files to a custom directory
" set backupdir=~/.vim/backup
