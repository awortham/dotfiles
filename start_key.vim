fun! Start()
  if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
    return
  endif
  enew

  setlocal
    \ bufhidden=wipe
    \ buftype=nofile
    \ nobuflisted
    \ nocursorcolumn
    \ nocursorline
    \ nolist
    \ nonumber
    \ noswapfile
    \ norelativenumber

  call append('$', "")
  call append('$', "")
  call append('$', "")
  call append('$', "")
  call append('$', "")
  call append('$', "")
  call append('$', "")
  call append('$', "")
  call append('$', "")
  call append('$', "")
  call append('$', "                            ________        ________                _______")
  call append('$', "                           |\\#######\'       \\#######               /######/")
  call append('$', "                           |#\\#######\'       \\#######             /######|")
  call append('$', "                           |##\\#######\'       \\#######    _      /######/")
  call append('$', "                           |###\\#######\'       \\#######  |#|    /######|")
  call append('$', "                          /#####\\#######\'       |####### /##\\  /#######|")
  call append('$', "                         /#######\\#######\'      |#######/####\\/#######/")
  call append('$', "                        /########  \\######\'     |######|#####/#######/")
  call append('$', "                       /########====\\######\'    |######|/   |#######/")
  call append('$', "                      /########      \\######\'   |######|    |######/")
  call append('$', "                      ¯¯¯¯¯¯¯¯¯        ¯¯¯¯¯¯¯  ¯¯¯¯¯¯¯¯    ¯¯¯¯¯¯¯")
  call append('$', "")
  call append('$', "")
  call append('$', "                                     Make Savage The Body")

  setlocal nomodifiable nomodified

  nnoremap <buffer><silent> e :enew<CR>
  nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
  nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

autocmd VimEnter * call Start()
