augroup livedown
  if g:livedown_autorun
    au! BufWinEnter <buffer> call LivedownPreview()
  endif

  au! VimLeave <buffer> call LivedownKill()
augroup END
