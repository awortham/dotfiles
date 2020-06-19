set runtimepath^=~/.runtimepath+=~/.vim/after
let &path = &runtimepath

set nocompatible
filetype off

  call plug#begin()
  set rtp+=/usr/local/opt/fzf

  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'                " nice looking footer bar
  Plug 'vim-airline/vim-airline-themes'
  Plug 'briancollins/vim-jst'             " JST / EJS syntax
  Plug 'flazz/vim-colorschemes'
  Plug 'christoomey/vim-sort-motion'
  Plug 'christoomey/vim-tmux-navigator'   " easy navigation b/w vim & tmux
  Plug 'darfink/vim-plist'                 " PLIST Syntax Highlighting / indentation
  Plug 'dense-analysis/ale'
  Plug 'garbas/vim-snipmate'
  Plug 'godlygeek/csapprox'               " better gvim color support
  Plug 'chriskempson/base16-vim'
  Plug 'kchmck/vim-coffee-script'         " coffeescript syntax & indent
  Plug 'marcWeber/vim-addon-mw-utils'    " These next three all support tab completion snipmate functionality
  Plug 'mattn/emmet-vim'                  " emmet stuff for vim [http://emmet.io/]
  Plug 'mustache/vim-mustache-handlebars' " mustache/handlebars syntax & indent
  Plug 'nathanaelkane/vim-indent-guides'  " Indent guides to keep your code aligned
  Plug 'othree/html5.vim'                 " html5 syntax & indent
  Plug 'pangloss/vim-javascript'          " javascript syntax & indent
  Plug 'rking/ag.vim'                     " more searching
  Plug 'janko/vim-test'
  Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'ngmy/vim-rubocop'
  Plug 'rhysd/git-messenger.vim'
  Plug 'ryanoasis/vim-devicons'           " Dev Icons
  Plug 'sbdchd/neoformat'
  Plug 'scrooloose/nerdtree'              " file menu
  Plug 'scrooloose/syntastic'             " syntax checker
  Plug 'slim-template/vim-slim'
  Plug 't9md/vim-ruby-xmpfilter'          " inline ruby completion
  Plug 'tommcdo/vim-exchange'
  Plug 'tomtom/tlib_vim'
  Plug 'tpope/vim-commentary'             " easily use comments
  Plug 'tpope/vim-endwise'                " auto end addition in ruby
  Plug 'tpope/vim-fugitive'              " git interaction from within vim
  Plug 'tpope/vim-haml'                   " haml syntax & indent
  Plug 'tpope/vim-markdown'               " markdown syntax & indent
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'                " Allows plugins to repeat
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'            " Allows for adding new lines above and below your current line and switching lines
  Plug 'cyphactor/vim-open-alternate'
  Plug 'vim-ruby/vim-ruby'                " ruby syntax & indent
  Plug 'wesQ3/vim-windowswap'             " window swapping
  Plug 'maxmellon/vim-jsx-pretty'

  "- forked this, made some mods and pulling from my own repo
  Plug 'awortham/vim-snippets'

  call plug#end()

  filetype plugin indent on

  syntax on                    " turn on syntax highilghting

  au InsertLeave * set nopaste " hoping this helps with neovim putting me in insert paste mode

  filetype plugin on           " enable loading plugins for filetypes
  runtime macros/matchit.vim
  filetype indent on           " enable loading 'indent files' for filetypes

  set synmaxcol=400            " no syntax highlighting for lines longer than 200 cols
  let g:vim_jsx_pretty_colorful_config = 1 " default 0

  set number                   " display line numbers
  set relativenumber
  set visualbell               " use visual bell

  set noro

  match ErrorMsg '\s\+$'       " highlight trailing whitespace

  set laststatus=2             " Fix for statusbar toggling

  set encoding=utf-8           " Fix special character encoding

  set cursorline               " show cursor line
  set ruler                    " cursor position in the lower right corner

  au VimResized * :wincmd =    " resize splits when window is resized

  "- Interaction ----------------------------------------------------------------------------------

  set ttyfast                  " improve screen refresh for terminal vim
  set lazyredraw               " don't redraw while executing macros. async window title update

  set scrolloff=3              " start scrolling 3 lines from bottom
  set sidescrolloff=6          " start scrolling 6 lines from right
  let loaded_match_paren = 1   " highlight matching parens

  set mouse=a                  " allow mouse usage
  set clipboard=unnamed        " set default yank register to machine clipboard
  nnoremap p p`]<Esc>
  set nofoldenable             " disable folding

  "- Wrapping -------------------------------------------------------------------------------------

  set nowrap                   " don't softwrap text
  set linebreak
  set formatoptions-=t         " don't automatically hardwrap text (use 'gq' to reflow text)
  set wrapmargin=0             " don't wrap based on terminal size

  "- Indentation ----------------------------------------------------------------------------------

  set autoindent               " indent next line to same level as current line
  set smartindent              "   ↑ but do it smartly
  set smarttab                 " <Tab> in front of a line inserts 'shiftwidth' blanks
  set shiftwidth=2             "   ↑ use 2 blanks for above
  set tabstop=2                " display a <Tab> as 2 spaces
  set softtabstop=2            " use 2 spaces for a <Tab>
  set expandtab

  "- wildmenu
  set wildmode=list:longest,full
  set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

  set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
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
  " for html
  autocmd FileType html setlocal indentkeys-=*<Return>
  autocmd FileType html.handlebars setlocal indentkeys-=*<Return>
  autocmd FileType eruby setlocal indentkeys-=*<Return>

  " linting
  let g:ale_linters = {'ruby': ['standardrb']}
  let g:ale_fixers = {'ruby': ['standardrb']}
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 0
  let g:ale_lint_on_enter = 0
  let g:ale_fix_on_save = 1
  let g:ruby_indent_assignment_style = 'variable'

  " prettier setup
  " autocmd BufWritePre *.js Neoformat
  " autocmd BufWritePre *.jsx Neoformat
  " autocmd FileType javascript set formatprg=./node_modules/prettier/bin-prettier.js\ --stdin\ --single-quote\ --no-semi\ --trailing-comma\ es5\ --parser\ babylon
  " let g:neoformat_try_formatprg = 1
  "let g:neoformat_only_msg_on_error = 1

  set hlsearch                 " highlight searching
  set ignorecase               " case insensitive search
  set smartcase                " case insensitive search
  set incsearch                " incremental search

  "- Theme ----------------------------------------------------------------------------------------

  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif

  let g:airline_theme='tomorrow'

  syntax enable
  colorscheme base16-tomorrow-night-eighties

  "" I would like to change the blue in this theme to this blue
  " set rubyInclude=#81a2b3
  " let s:gui0D        = "81a2b3"
  " let g:base16_gui0D = "81a2b3"
  " let g:terminal_color_4 =  "#81a2b3"
  " let g:terminal_color_12 = "#6699cc"

  " Console 256 Colours
  if !has("gui_running")
    let s:background = "303030"
    let s:window = "5e5e5e"
    let s:line = "3a3a3a"
    let s:selection = "585858"
  end

  highlight ErrorMsg guibg=#6699cc
  hi CursorLineNr guifg=#6699cc

  "- Git Gutter" These settings must be below the base16colorspace setting
  set updatetime=100
  set signcolumn=yes
  highlight GitGutterAdd    guifg=#b5bd68
  highlight GitGutterChange guifg=#f0c674
  highlight GitGutterDelete guifg=#cc6666

  "- Git messenger
  nmap <Leader>m <Plug>(git-messenger)

  "- Git Commit
  autocmd Filetype gitcommit set colorcolumn=50,72
  "- Searching ------------------------------------------------------------------------------------

  let &colorcolumn=join(range(81,999),",")

  let g:NERDTreeWinSize=60

  "- Utilities ======================================================================================

  set noswapfile                     " don't create swap files
  set autowrite                      " write the old file out when switching between files
  autocmd BufWritePre * :%s/\s\+$//e " auto strip whitespace on save

  "- Snippets with multiple inputs. Jump to next input using tab
  if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
  endif

  "- Keys ===========================================================================================

  let mapleader = ','                       " set <Leader>
  set backspace=indent,eol,start            " make backspace behave as expected

  "- easy splits and switches over (\v)
  nnoremap <leader>v <C-w>v<C-w><C-w>
  nnoremap <leader>h <C-w>s<C-w><C-w>

  "- open related spec files quickly
  nnoremap <leader>q :OpenAlternate<cr>

  "- make 0 take you back to the first word on a line
  nnoremap 0 ^

  "- map escape key to jj
  imap jj <esc>

  "- use black hole register
  noremap x "_x

  "- easier window navigation
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l

  "- remove highlighting after a search"
  nmap <leader>r :noh<cr>

  "- quick edit VIMRC
  nmap <silent> <leader>ev :e $MYVIMRC<CR>
  "- quick reload VIMRC
  nmap <silent> <leader>sv :so $MYVIMRC<CR>

  "- quick switch file
  nnoremap <leader><leader> <c-^>

  "- Syntastic ------------------------------------------------------------------------------------
  let g:syntastic_mode_map={ 'mode': 'active',
        \ 'active_filetypes': [],
        \ 'passive_filetypes': ['html', 'css', 'scss'] } " disable checking for html and css

  "- Markdown ------------------------------------------------------------------------------------
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass']

  "- NerdTree -------------------------------------------------------------------------------------
  nnoremap <C-k><C-b> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1    " show hidden files
  let NERDTreeQuitOnOpen = 1  " Hide NERDTree when opening a file

  "- JSX ------------------------------------------------------------------------------------
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files

  "- Custom ignore paths
  set wildignore+=*/tmp/*,*/bin/*,*/bower_components/*,*.so,*.swp,*.zip     " MacOSX/Linux

  "- vim-test
  nmap <silent> <leader>s :TestNearest<CR>
  nmap <silent> <leader>t :TestFile<CR>
  nmap <silent> <leader>a :TestSuite<CR>
  nmap <silent> <CR> :TestLast<CR>
  nmap <silent> <leader>g :TestVisit<CR>
  let test#strategy = "neovim"
  let test#ruby#use_binstubs = 1
  let test#ruby#use_spring_binstub = 1
  let g:test#preserve_screen = 1

  "- Rubocop set the correct file to use
  let g:vimrubocop_config = '~/.rubocop.yml'
  map <Leader>z :RuboCop<CR>

  "- XMPFilter  ------------------------------------------------------------------------------------
  map <C-b> <Plug>(xmpfilter-mark)<Plug>(xmpfilter-run)

  "- Indent Guides ---------------------------------------------------------------------------------
  let g:indent_guides_color_change_percent = 3      " ultra-low-contrast guides
  let g:indent_guides_guide_size = 2                " between 0 and 'shiftwidth'
  let g:indent_guides_start_level = 1               " don't show guides until the third indent

  "- Airline ========================================================================================
  let g:airline_powerline_fonts = 1

  "- Git Commands ===============================
  nnoremap <Leader>g :Git<CR>

  "- ES6---------------------------------------------------------------------------------------
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  "- JavaScript
  autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
  autocmd FileType javascript inoremap (; ();<Esc>hi

  "- J Builder ------------------------------------------------------------------------------------
  au BufNewFile,BufRead *.json.jbuilder set ft=ruby       " set syntax to ruby for jBuilder files

  "- For running commands in a new window ========================================================
  function! s:ExecuteInShell(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! execute 'resize ' . line('$')
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
    echo 'Shell command ' . command . ' executed.'
    wincmd k
  endfunction
  command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

  "- FZF =========================================================================
  let g:fzf_buffers_jump = 1

  "- Open FZF
  noremap <C-p> :Files<CR>

  "- Default fzf layout
  "- down / up / left / right
  let g:fzf_layout = { 'down': '~30%' }

  nmap <silent> <leader>w :exec 'silent !google-chrome % &'

  "- Press Function and then F3 while the cursor is over an attribute - it'll list out the
  "- attribute name and the color for highlight adjustments
  map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

