let s:initialized_client = 0
let s:script_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

if !exists('http_client_bind_hotkey')
  let g:http_client_bind_hotkey = 1
endif

function! s:DoHTTPRequest()
  if !has('python')
    echo 'Error: this plugin requires vim compiled with python support.'
    finish
  endif

  if !s:initialized_client
    let s:initialized_client = 1
    execute 'pyfile ' . s:script_path . '/http_client.py'
  endif

  python do_request_from_buffer()
endfunction

command! -nargs=0 HTTPClientDoRequest call <SID>DoHTTPRequest()

if g:http_client_bind_hotkey
  silent! nnoremap <unique> <Leader>tt :HTTPClientDoRequest<cr>
endif
