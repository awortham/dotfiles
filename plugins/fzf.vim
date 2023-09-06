Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

let g:fzf_buffers_jump = 1

noremap <C-p> :Files<CR>
let g:fzf_layout = { 'down': '~30%' }
