if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable
colorscheme OceanicNext

if !has("gui_running")
  let s:background = "303030"
  let s:window = "5e5e5e"
  let s:line = "3a3a3a"
  let s:selection = "585858"
end

highlight ErrorMsg guibg=#6699cc
hi CursorLineNr guifg=#6699cc
hi rubyInterpolation guifg=#c0c5ce
