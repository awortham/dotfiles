Plug 'janko/vim-test'

nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <CR> :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "neovim"
let test#ruby#use_binstubs = 1
let test#ruby#use_spring_binstub = 1
let g:test#preserve_screen = 1

