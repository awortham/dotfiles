let g:ruby_host_prog = '~/.rbenv/versions/2.7.5/bin/neovim-ruby-host'
let g:python2_host_prog='/usr/bin/python2'
set runtimepath^=~/.runtimepath+=~/.vim/after
let &path = &runtimepath

let mapleader = ','

set nocompatible
set synmaxcol=400
set number
set relativenumber
set visualbell
set noro
set laststatus=2
set encoding=utf-8
set cursorline
set ruler
set ttyfast
set lazyredraw
set scrolloff=3
set sidescrolloff=6
set mouse=a
set clipboard=unnamed

set nofoldenable

set wrap
set linebreak
set formatoptions-=t
set wrapmargin=0
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set wildmode=list:longest,full
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/tmp/*,*/bin/*,*/bower_components/*,*.so,*.swp,*.zip     " MacOSX/Linux
set hlsearch
set ignorecase
set smartcase
set incsearch
set noswapfile
set autowrite
set backspace=indent,eol,start

filetype off

  call plug#begin()
  set rtp+=/usr/local/opt/fzf

  source ~/.config/nvim/plugins/gitgutter.vim
  source ~/.config/nvim/plugins/jst.vim
  source ~/.config/nvim/plugins/colorschemes.vim
  source ~/.config/nvim/plugins/sort_motion.vim
  source ~/.config/nvim/plugins/tmux_navigator.vim
  source ~/.config/nvim/plugins/plist.vim
  source ~/.config/nvim/plugins/ale.vim
  source ~/.config/nvim/plugins/snipmate.vim
  source ~/.config/nvim/plugins/csapprox.vim
  source ~/.config/nvim/plugins/base16.vim
  source ~/.config/nvim/plugins/highlightedyank.vim
  source ~/.config/nvim/plugins/emmet.vim
  source ~/.config/nvim/plugins/indent_guides.vim
  source ~/.config/nvim/plugins/html5.vim
  source ~/.config/nvim/plugins/javascript.vim
  source ~/.config/nvim/plugins/ag.vim
  source ~/.config/nvim/plugins/test.vim
  source ~/.config/nvim/plugins/fzf.vim
  source ~/.config/nvim/plugins/rubocop.vim
  source ~/.config/nvim/plugins/oceanic_next.vim
  source ~/.config/nvim/plugins/git_messenger.vim
  source ~/.config/nvim/plugins/neoformat.vim
  source ~/.config/nvim/plugins/nerdtree.vim
  source ~/.config/nvim/plugins/slim.vim
  source ~/.config/nvim/plugins/ruby_xmpfilter.vim
  source ~/.config/nvim/plugins/exchange.vim
  source ~/.config/nvim/plugins/commentary.vim
  source ~/.config/nvim/plugins/endwise.vim
  source ~/.config/nvim/plugins/fugitive.vim
  source ~/.config/nvim/plugins/haml.vim
  source ~/.config/nvim/plugins/rails.vim
  source ~/.config/nvim/plugins/repeat.vim
  source ~/.config/nvim/plugins/sensible.vim
  source ~/.config/nvim/plugins/surround.vim
  source ~/.config/nvim/plugins/unimpaired.vim
  source ~/.config/nvim/plugins/open_alternate.vim
  source ~/.config/nvim/plugins/ruby.vim
  source ~/.config/nvim/plugins/windowswap.vim
  source ~/.config/nvim/plugins/jsx_pretty.vim
  source ~/.config/nvim/plugins/devicons.vim

  call plug#end()

  source ~/.config/nvim/theme.vim
  source ~/.config/nvim/start_key.vim

  filetype plugin indent on

  au InsertLeave * set nopaste " hoping this helps with neovim putting me in insert paste mode

  runtime macros/matchit.vim

  let g:vim_jsx_pretty_colorful_config = 1 " default 0

  match ErrorMsg '\s\+$'       " highlight trailing whitespace

  au VimResized * :wincmd =    " resize splits when window is resized

  let loaded_match_paren = 1   " highlight matching parens

  autocmd FileType html setlocal indentkeys-=*<Return>
  autocmd FileType html.handlebars setlocal indentkeys-=*<Return>
  autocmd FileType eruby setlocal indentkeys-=*<Return>

  autocmd BufWritePre * :%s/\s\+$//e " auto strip whitespace on save

  nnoremap p p`]<Esc>
  nnoremap <Leader>T :tabnew %<Return>
  map <Leader>gco iCo-authored-by: asdf <asdf@asdf.com><esc>7b
  nnoremap <leader>v <C-w>v<C-w><C-w>
  nnoremap <leader>h <C-w>s<C-w><C-w>
  nnoremap 0 ^
  imap jj <esc>
  noremap x "_x
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l
  nmap <leader>r :noh<cr>

  "- Press Function and then F3 while the cursor is over an attribute - it'll list out the
  "- attribute name and the color for highlight adjustments
  map <F5> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass']
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files

  autocmd BufRead,BufNewFile *.es6 setfiletype javascript
  autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
  autocmd FileType javascript inoremap (; ();<Esc>hi

  au BufNewFile,BufRead *.json.jbuilder set ft=ruby       " set syntax to ruby for jBuilder files
