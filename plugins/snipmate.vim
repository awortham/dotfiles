" These next three all support tab completion snipmate functionality
Plug 'marcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'awortham/vim-snippets'

let g:snipMate = { 'snippet_version' : 1 }

"- Snippets with multiple inputs. Jump to next input using tab
if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

