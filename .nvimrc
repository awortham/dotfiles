let g:ruby_host_prog = '~/.rbenv/versions/2.7.4/bin/neovim-ruby-host'
let g:python2_host_prog='/usr/bin/python2'
set runtimepath^=~/.runtimepath+=~/.vim/after
let &path = &runtimepath

let mapleader = ','                       " set <Leader>
set nocompatible

filetype off

  call plug#begin()
  set rtp+=/usr/local/opt/fzf

  source ~/.config/nvim/plugins/gitgutter.vim
  source ~/.config/nvim/plugins/airline.vim
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
  source ~/.config/nvim/plugins/addon_mw_utils.vim
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
  " source ~/.config/nvim/plugins/neoformat.vim                                   feature-mobile-mar ✭
  Plug 'sbdchd/neoformat'
  " source ~/.config/nvim/plugins/nerdtree.vim                                    feature-mobile-mar ✭
  Plug 'scrooloose/nerdtree'
  " source ~/.config/nvim/plugins/syntastic.vim                                   feature-mobile-mar ✭
  Plug 'scrooloose/syntastic'
  " source ~/.config/nvim/plugins/slim.vim                                        feature-mobile-mar ✭
  Plug 'slim-template/vim-slim'
  " source ~/.config/nvim/plugins/ruby_xmpfilter.vim                              feature-mobile-mar ✭
  Plug 't9md/vim-ruby-xmpfilter'
  " source ~/.config/nvim/plugins/exchange.vim                                    feature-mobile-mar ✭
  Plug 'tommcdo/vim-exchange'
  source ~/.config/nvim/plugins/tlib.vim
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
  source ~/.config/nvim/plugins/snippets.vim

  call plug#end()

  source ~/.config/nvim/start_key.vim

  filetype plugin indent on

  syntax on                    " turn on syntax highilghting

  au InsertLeave * set nopaste " hoping this helps with neovim putting me in insert paste mode

  filetype plugin on           " enable loading plugins for filetypes
  runtime macros/matchit.vim
  filetype indent on           " enable loading 'indent files' for filetypes

  set synmaxcol=400            " no syntax highlighting for lines longer than 200 cols
  let g:vim_jsx_pretty_colorful_config = 1 " default 0

  " Set version to new version to remove deprecation error
  let g:snipMate = { 'snippet_version' : 1 }

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
  let g:ale_linters = {'ruby': ['standardrb'], 'javascript': ['prettier']}
  let g:ale_fixers = {'ruby': ['standardrb'], 'javascript': ['eslint']}
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 0
  let g:ale_lint_on_enter = 0
  let g:ale_lint_on_save = 1
  let g:ale_fix_on_save = 0
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

  " let g:airline_theme='tomorrow'
  let g:airline_theme='oceanicnext'

  syntax enable
  " colorscheme base16-tomorrow-night-eighties
  colorscheme OceanicNext

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
  hi rubyInterpolation guifg=#c0c5ce

  "- Git Gutter" These settings must be below the base16colorspace setting
  set updatetime=100
  set signcolumn=yes
  highlight GitGutterAdd    guifg=#b5bd68
  highlight GitGutterChange guifg=#f0c674
  highlight GitGutterDelete guifg=#cc6666

  "- Git Commit
  autocmd Filetype gitcommit set colorcolumn=50,72
  autocmd FileType gitcommit set textwidth=72

  autocmd VimEnter COMMIT_EDITMSG call OpenCommitMessageDiff()
  function OpenCommitMessageDiff()
    " Save the contents of the z register
    let old_z = getreg("z")
    let old_z_type = getregtype("z")

    try
      call cursor(1, 0)
      let diff_start = search("^diff --git")
      if diff_start == 0
        " There's no diff in the commit message; generate our own.
        let @z = system("git diff --cached -M -C")
      else
        " Yank diff from the bottom of the commit message into the z register
        :.,$yank z
        call cursor(1, 0)
      endif

      " Paste into a new buffer
      vnew
      normal! V"zP
    finally
      " Restore the z register
      call setreg("z", old_z, old_z_type)
    endtry

    " Configure the buffer
    set filetype=diff noswapfile nomodified readonly
    silent file [Changes\ to\ be\ committed]

    " Get back to the commit message
    wincmd p
  endfunction

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

  set backspace=indent,eol,start            " make backspace behave as expected

  " nmap <silent> <leader>s :TestNearest<CR>
  " nmap <silent> <leader>t :TestFile<CR>
  " nmap <silent> <leader>a :TestSuite<CR>
  " nmap <silent> <CR> :TestLast<CR>
  " nmap <silent> <leader>g :TestVisit<CR>
  " let test#strategy = "neovim"
  " let test#ruby#use_binstubs = 1
  " let test#ruby#use_spring_binstub = 1
  " let g:test#preserve_screen = 1

  "- Git messenger
  nmap <Leader>m <Plug>(git-messenger)

  "-open current file in new tab
  nnoremap <Leader>T :tabnew %<Return>

  " Hotkey for adding 'Co-authored-by:' for GitHub
  map <Leader>gco iCo-authored-by: asdf <asdf@asdf.com><esc>7b

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
  let g:NERDTreeWinSize=60
  nmap <leader>f :NERDTreeFind<cr>

  "- JSX ------------------------------------------------------------------------------------
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files

  "- Custom ignore paths
  set wildignore+=*/tmp/*,*/bin/*,*/bower_components/*,*.so,*.swp,*.zip     " MacOSX/Linux

  "- XMPFilter  ------------------------------------------------------------------------------------
  map <C-b> <Plug>(xmpfilter-mark)<Plug>(xmpfilter-run)

  "- Indent Guides ---------------------------------------------------------------------------------
  let g:indent_guides_color_change_percent = 3      " ultra-low-contrast guides
  let g:indent_guides_guide_size = 2                " between 0 and 'shiftwidth'
  let g:indent_guides_start_level = 1               " don't show guides until the third indent

  "- Airline ========================================================================================
  let g:airline_powerline_fonts = 1

  "- ES6---------------------------------------------------------------------------------------
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  "- JavaScript
  autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
  autocmd FileType javascript inoremap (; ();<Esc>hi

  "- J Builder ------------------------------------------------------------------------------------
  au BufNewFile,BufRead *.json.jbuilder set ft=ruby       " set syntax to ruby for jBuilder files

  "- Press Function and then F3 while the cursor is over an attribute - it'll list out the
  "- attribute name and the color for highlight adjustments
  map <F5> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

  nnoremap <leader>l :ALEFix<cr>:w<cr>

