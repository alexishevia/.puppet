" load pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
Helptags

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

" set status line
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

" make tab labels visible always
set showtabline=2

" define a "remove trailing whitespace" function:
fun! <SID>TrimWhiteSpace()
  " Don't strip on these filetypes
  if &ft =~ 'markdown\|mkd'
    return
  endif
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

"remove trailing whitespace on file save:
autocmd BufWritePre * :call <SID>TrimWhiteSpace()

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

" make NERDTree ignore public folder
"let NERDTreeIgnore = ['\public\/*$']

" show hidden files on NERDTree
let NERDTreeShowHidden=1

" use old folder markers (avoids issues with some terminals)
let g:NERDTreeDirArrows=0

" use ,p to do fuzzy search
map <Leader>p :CtrlP<Enter>

" use ,f to search for a string inside current project using Ack
map <Leader>f :tabnew<Enter>:Ack<space>

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
map <F9> :execute "tabmove" tabpagenr() <CR>

" make sure wrap is not turned off by vimdiff
au VimEnter * if &diff | execute 'windo set wrap' | endif

" set filetypes for common extensions
au BufNewFile,BufRead *.pp set filetype=ruby
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead *.jbuilder set filetype=ruby

" disable markdown folding
let g:vim_markdown_folding_disabled=1

" use camelcase motion for moving between words
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
set iskeyword+=-

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

" how many columns a tab counts for
set tabstop=2

" how many columns text is indented with the reindent operations (<< and >>)
set shiftwidth=2

" amount of columns vim uses when you hit Tab in insert mode
set softtabstop=2

" convert tabs to spaces
:set expandtab

" highlight leading tabs
augroup unwantedchars
  autocmd!
  :autocmd BufWinEnter * match UnwantedChars /^\t\+/
augroup END
:highlight UnwantedChars ctermbg=darkgreen guibg=darkgreen

" display tabs and trailing spaces
set listchars=tab:>-,trail:~
set list

" use 4 spaces for python files
au FileType python setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4

" highlight current line
set cursorline

" syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pylama']
let g:syntastic_javascript_checkers=['jsxhint']
