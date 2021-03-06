  ""= Initial setup ==================================================================================

  "  " use Vim settings, rather than Vi settings, required for Vundle
  "  set nocompatible
  "  filetype off

  "  " initialize Vundle and rebuild helptags
  " set rtp+=~/.vim/bundle/Vundle.vim
  " set rtp+=/usr/local/opt/fzf
  " call vundle#begin()

  "   Plugin 'airblade/vim-gitgutter'
  "   Plugin 'bling/vim-airline'                " nice looking footer bar
  "   Plugin 'briancollins/vim-jst'             " JST / EJS syntax
  "   Plugin 'flazz/vim-colorschemes'
  "   Plugin 'christoomey/vim-sort-motion'
  "   Plugin 'christoomey/vim-tmux-navigator'   " easy navigation b/w vim & tmux
  "   Plugin 'darfink/vim-plist'                 " PLIST Syntax Highlighting / indentation
  "   Plugin 'garbas/vim-snipmate'
  "   Plugin 'gmarik/Vundle.vim'                " let Vundle manage Vundle, required
  "   Plugin 'godlygeek/csapprox'               " better gvim color support
  "   Plugin 'godlygeek/tabular'                " for indentation
  "   Plugin 'philtr/base16-default-vim'
  "   Plugin 'kchmck/vim-coffee-script'         " coffeescript syntax & indent
  "   Plugin 'marcWeber/vim-addon-mw-utils'    " These next three all support tab completion snipmate functionality
  "   Plugin 'mattn/emmet-vim'                  " emmet stuff for vim [http://emmet.io/]
  "   Plugin 'mileszs/ack.vim'                  " searching via :Ack
  "   Plugin 'mustache/vim-mustache-handlebars' " mustache/handlebars syntax & indent
  "   Plugin 'nathanaelkane/vim-indent-guides'  " Indent guides to keep your code aligned
  "   Plugin 'othree/html5.vim'                 " html5 syntax & indent
  "   Plugin 'pangloss/vim-javascript'          " javascript syntax & indent
  "   Plugin 'rking/ag.vim'                     " more searching
  "   Plugin 'janko/vim-test'
  "   Plugin 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': './install --bin' }
  "   Plugin 'junegunn/fzf.vim'
  "   Plugin 'ngmy/vim-rubocop'
  "   " Plugin 'rhysd/git-messenger.vim'
  "   Plugin 'ryanoasis/vim-devicons'           " Dev Icons
  "   Plugin 'sbdchd/neoformat'
  "   Plugin 'scrooloose/nerdtree'              " file menu
  "   Plugin 'scrooloose/syntastic'             " syntax checker
  "   Plugin 'slim-template/vim-slim.git'
  "   Plugin 't9md/vim-ruby-xmpfilter'          " inline ruby completion
  "   Plugin 'terryma/vim-multiple-cursors'
  "   Plugin 'tommcdo/vim-exchange'
  "   Plugin 'tomtom/tlib_vim'
  "   Plugin 'tpope/vim-commentary'             " easily use comments
  "   Plugin 'tpope/vim-endwise'                " auto end addition in ruby
  "   Plugin 'tpope/vim-fugitive'              " git interaction from within vim
  "   Plugin 'tpope/vim-haml'                   " haml syntax & indent
  "   Plugin 'tpope/vim-markdown'               " markdown syntax & indent
  "   Plugin 'tpope/vim-rails'
  "   Plugin 'tpope/vim-repeat'                " Allows plugins to repeat
  "   Plugin 'tpope/vim-sensible'
  "   Plugin 'tpope/vim-surround'
  "   Plugin 'tpope/vim-unimpaired'            " Allows for adding new lines above and below your current line and switching lines
  "   Plugin 'cyphactor/vim-open-alternate'
  "   Plugin 'vim-ruby/vim-ruby'                " ruby syntax & indent
  "   Plugin 'wesQ3/vim-windowswap'             " window swapping
  "   Plugin 'maxmellon/vim-jsx-pretty'

  "   " forked this, made some mods and pulling from my own repo
  "   Plugin 'awortham/vim-snippets'
  "  " end Vundle init (required)
  "  call vundle#end()

  "  filetype plugin indent on

""   "= Interface ======================================================================================

""     "- Appearance -----------------------------------------------------------------------------------

  "   syntax on                    " turn on syntax highilghting

  "    au InsertLeave * set nopaste " hoping this helps with neovim putting me in insert paste mode

  "    filetype plugin on           " enable loading plugins for filetypes
  "    runtime macros/matchit.vim
  "    filetype indent on           " enable loading 'indent files' for filetypes

  "    set synmaxcol=400            " no syntax highlighting for lines longer than 200 cols
  "    set laststatus=2             " show status bar
  "    let g:vim_jsx_pretty_colorful_config = 1 " default 0

  "    set number                   " display line numbers
  "    set relativenumber
  "    set visualbell               " use visual bell

  "    set noro

  "    set background=dark          " Dark background
  "    set laststatus=2             " Fix for statusbar toggling
  "    set encoding=utf-8           " Fix special character encoding
  "    set t_Co=256                 " MOAR COLORS

  "    set cursorline               " show cursor line
  "    set ruler                    " cursor position in the lower right corner

  "    match ErrorMsg '\s\+$'       " highlight trailing whitespace

  "    au VimResized * :wincmd =    " resize splits when window is resized

""     "- Interaction ----------------------------------------------------------------------------------

  "    set ttyfast                  " improve screen refresh for terminal vim
  "    set lazyredraw               " don't redraw while executing macros. async window title update
  "    if !has('nvim')
  "      set ttyscroll=3              " something about scrolling buffer size
  "    endif

  "    set scrolloff=3              " start scrolling 3 lines from bottom
  "    set sidescrolloff=6          " start scrolling 6 lines from right
  "    let loaded_match_paren = 1   " highlight matching parens

  "    set mouse=a                  " allow mouse usage
  "    set clipboard=unnamed        " set default yank register to machine clipboard
  "    nnoremap p p`]<Esc>
  "    set nofoldenable             " disable folding

""     "- Wrapping -------------------------------------------------------------------------------------

  "    set nowrap                   " don't softwrap text
  "    set linebreak
  "    set formatoptions-=t         " don't automatically hardwrap text (use 'gq' to reflow text)
  "    set wrapmargin=0             " don't wrap based on terminal size

""     "- Indentation ----------------------------------------------------------------------------------

  "    set autoindent               " indent next line to same level as current line
  "    set smartindent              "   ↑ but do it smartly
  "    set smarttab                 " <Tab> in front of a line inserts 'shiftwidth' blanks
  "    set shiftwidth=2             "   ↑ use 2 blanks for above
  "    set tabstop=2                " display a <Tab> as 2 spaces
  "    set softtabstop=2            " use 2 spaces for a <Tab>
  "    set expandtab

  "    " wildmenu
  "    set wildmode=list:longest,full
  "    set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

  "    set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
  "    set wildignore+=*vim/backups*
  "    set wildignore+=*sass-cache*
  "    set wildignore+=*DS_Store*
  "    set wildignore+=vendor/rails/**
  "    set wildignore+=vendor/cache/**
  "    set wildignore+=*.gem
  "    set wildignore+=log/**
  "    set wildignore+=tmp/**
  "    set wildignore+=*.png,*.jpg,*.gif
  "    set wildignore+=*/tmp/*,*/bin/*,*/bower_components/*,*.so,*.swp,*.zip     " MacOSX/Linux
  "    " for html
  "    autocmd FileType html setlocal indentkeys-=*<Return>
  "    autocmd FileType html.handlebars setlocal indentkeys-=*<Return>
  "    autocmd FileType eruby setlocal indentkeys-=*<Return>

  "    " prettier setup
  "    " autocmd BufWritePre *.js Neoformat
  "    " autocmd BufWritePre *.jsx Neoformat
  "    " autocmd FileType javascript set formatprg=./node_modules/prettier/bin-prettier.js\ --stdin\ --single-quote\ --no-semi\ --trailing-comma\ es5\ --parser\ babylon
  "    " let g:neoformat_try_formatprg = 1
  "    "let g:neoformat_only_msg_on_error = 1

  "    "--Git Gutter"
  "    set updatetime=100
  "    set signcolumn=yes
  "    highlight GitGutterAdd    guifg=#009900 ctermfg=143
  "    highlight GitGutterChange guifg=#bbbb00 ctermfg=143
  "    highlight GitGutterDelete guifg=#ff2222 ctermfg=143

""       "- Git Commit
  "    autocmd Filetype gitcommit set colorcolumn=50,72
""       "- Searching ------------------------------------------------------------------------------------

  "    set hlsearch                 " highlight searching
  "    set ignorecase               " case insensitive search
  "    set smartcase                " case insensitive search
  "    set incsearch                " incremental search

""       "- Theme ----------------------------------------------------------------------------------------

  "    set background=dark      " dark background
  "    syntax enable
  "    " colorscheme flatlandia   " flatlandia colorscheme
  "    " colorscheme base16-default-dark
  "    colorscheme Tomorrow-Night

  "    let base16colorspace=256

  "    let &colorcolumn=join(range(81,999),",")
  "    " highlight ColorColumn ctermbg=235 guibg=#2c2d27
  "    " highlight SignColumn ctermbg=NONE guibg=NONE gui=NONE

  "    "= Utilities ======================================================================================

  "    set noswapfile                     " don't create swap files
  "    set autowrite                      " write the old file out when switching between files
  "    autocmd BufWritePre * :%s/\s\+$//e " auto strip whitespace on save

  "    "- Snippets with multiple inputs. Jump to next input using tab
  "    if !exists("g:UltiSnipsJumpForwardTrigger")
  "      let g:UltiSnipsJumpForwardTrigger = "<tab>"
  "    endif

  "    "= Keys ===========================================================================================

  "    let mapleader = ','                       " set <Leader>
  "    set backspace=indent,eol,start            " make backspace behave as expected

  "    " easy splits and switches over (\v)
  "    nnoremap <leader>v <C-w>v<C-w><C-w>
  "    nnoremap <leader>h <C-w>s<C-w><C-w>

  "    " open related spec files quickly
  "    nnoremap <leader>q :OpenAlternate<cr>

  "    " make 0 take you back to the first word on a line
  "    nnoremap 0 ^

  "    " map escape key to jj -- much faster, comments above b/c of Vim's interpretation of them jumping my cursor
  "    " imap jj <esc>:w<cr>
  "    imap jj <esc>

  "    " use black hole register
  "    noremap x "_x

  "    " mapping multi cursor keys for vim-multiple-cursors
  "    let g:multi_cursor_use_default_mapping=0
  "    let g:multi_cursor_next_key='<C-n>'
  "    let g:multi_cursor_prev_key='<C-p>'
  "    let g:multi_cursor_skip_key='<C-x>'
  "    let g:multi_cursor_quit_key='<jj>'

  "    " easier window navigation
  "    nmap <C-h> <C-w>h
  "    nmap <C-j> <C-w>j
  "    nmap <C-k> <C-w>k
  "    nmap <C-l> <C-w>l

  "    " kill the trailing whitespace
  "    nnoremap <leader>rtw :%s/\s\+$//e<CR>

  "    "remove highlighting after a search"
  "    nmap <leader>r :noh<cr>
  "    " toggle Paste mode, comments above b/c of Vim's interpretation of them jumping my cursor
  "    nnoremap <F6> :set paste!<cr>

  "    " toggle No Highlight mode, comments above b/c of Vim's interpretation of them jumping my cursor
  "    nnoremap <F7> :noh<cr>

  "    " quick edit VIMRC
  "    nmap <silent> <leader>ev :e $MYVIMRC<CR>
  "    " quick reload VIMRC
  "    nmap <silent> <leader>sv :so $MYVIMRC<CR>

  "    " quick switch file
  "    nnoremap <leader><leader> <c-^>

  "    "= Plugin Settings=================================================================================

  "    "- Syntastic ------------------------------------------------------------------------------------
  "    let g:syntastic_mode_map={ 'mode': 'active',
  "          \ 'active_filetypes': [],
  "          \ 'passive_filetypes': ['html', 'css', 'scss'] } " disable checking for html and css

  "    " let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
  "    " let g:syntastic_javascript_checkers = ['eslint']

  "    "- Markdown ------------------------------------------------------------------------------------
  "    let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass']

  "    "- NerdTree -------------------------------------------------------------------------------------
  "    " toggle NerdTree (ControlK + ControlB)
  "    nnoremap <C-k><C-b> :NERDTreeToggle<CR>
  "    let NERDTreeShowHidden=1    " show hidden files
  "    let NERDTreeQuitOnOpen = 1  " Hide NERDTree when opening a file

  "    "- Tabularize  ----------------------------------------------------------------------------------
  "    vmap <Leader>= :Tabularize /=<CR>
  "    vmap <Leader>{ :Tabularize /{<CR>

  "    "- Control-P ------------------------------------------------------------------------------------
  "    " Don't use caching
  "    let g:ctrlp_use_caching = 0

  "    "- JSX ------------------------------------------------------------------------------------
  "    let g:jsx_ext_required = 0 " Allow JSX in normal JS files

  "    " Custom ignore paths
  "    set wildignore+=*/tmp/*,*/bin/*,*/bower_components/*,*.so,*.swp,*.zip     " MacOSX/Linux
  "    let g:ctrlp_custom_ignore = {
  "          \ 'dir':  'node_modules',
  "          \ }

  "    "- Ack ------------------------------------------------------------------------------------------
  "    let g:ackprg = 'ag --nogroup --nocolor --column'

  "    " vim-test
  "    nmap <silent> <leader>s :TestNearest<CR>
  "    nmap <silent> <leader>t :TestFile<CR>
  "    nmap <silent> <leader>a :TestSuite<CR>
  "    nmap <silent> <CR> :TestLast<CR>
  "    nmap <silent> <leader>g :TestVisit<CR>
  "    let test#strategy = "neovim"
  "    let test#ruby#use_spring_binstub = 0
  "    let g:test#preserve_screen = 1

  "    "- Rubocop set the correct file to use
  "    let g:vimrubocop_config = '~/.rubocop.yml'
  "    map <Leader>z :RuboCop<CR>

  "    "- XMPFilter  ------------------------------------------------------------------------------------
  "    map <C-b> <Plug>(xmpfilter-mark)<Plug>(xmpfilter-run)

  "    "- Indent Guides ---------------------------------------------------------------------------------
  "    let g:indent_guides_color_change_percent = 3      " ultra-low-contrast guides
  "    let g:indent_guides_guide_size = 2                " between 0 and 'shiftwidth'
  "    let g:indent_guides_start_level = 1               " don't show guides until the third indent

  "    "= Airline ========================================================================================
  "    let g:airline_powerline_fonts = 1

  "    "= Git Commands ===============================
  "    nnoremap <Leader>g :Gstatus<CR>

  "    "= Language Specific Settings======================================================================

  "    "- Golang ---------------------------------------------------------------------------------------
  "    let g:go_fmt_command = 'goimports'     " use gofmt on save w/ go commands (from go plugin)

  "    function! ExecuteGoCode()              " for running Golang on enter
  "      exec ":!clear && go run " . @%
  "    endfunction

  "    "- C ---------------------------------------------------------------------------------------
  "    function! ExecuteCCode()
  "      exec ':Shell gcc ' . @% . ' -o file && ./file'
  "    endfunction

  "    "- Rust-------------------------------------------------------------------------------------
  "    function! ExecuteRustCode()
  "      exec ':Shell rustc ' . @% . ' -o file && ./file'
  "    endfunction

  "    "- ES6---------------------------------------------------------------------------------------
  "    autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  "    "- JavaScript
  "    autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
  "    autocmd FileType javascript inoremap (; ();<Esc>hi

  "    "- J Builder ------------------------------------------------------------------------------------
  "    au BufNewFile,BufRead *.json.jbuilder set ft=ruby       " set syntax to ruby for jBuilder files

  "    "- HBARS ------------------------------------------------------------------------------------
  "    au BufNewFile,BufRead *.hbars set ft=haml       " set syntax to haml, even tho it's not ruby, for hbars files

  "    "= For running commands in a new window ========================================================
  "    function! s:ExecuteInShell(command)
  "      let command = join(map(split(a:command), 'expand(v:val)'))
  "      let winnr = bufwinnr('^' . command . '$')
  "      silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  "      setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  "      echo 'Execute ' . command . '...'
  "      silent! execute 'silent %!'. command
  "      silent! execute 'resize ' . line('$')
  "      silent! redraw
  "      silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  "      silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  "      echo 'Shell command ' . command . ' executed.'
  "      wincmd k
  "    endfunction
  "    command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

  "    "= FZF =========================================================================
  "    let g:fzf_buffers_jump = 1

  "    " Open FZF
  "    noremap <C-p> :Files<CR>

  "    " Default fzf layout
  "    " - down / up / left / right
  "    let g:fzf_layout = { 'down': '~30%' }

  "    " Press F3 while the cursor is over an attribute - it'll list out the
  "    " attribute name and the color for highlight adjustments
  "    map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
