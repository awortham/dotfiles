  local opt = vim.opt

  vim.g.mapleader = ","

  opt.autoindent = true
  opt.autowrite = true
  opt.backspace = "indent,eol,start"
  opt.clipboard:append("unnamed")
  opt.compatible = false
  opt.cursorline = true
  opt.encoding = "utf-8"
  opt.expandtab = true
  opt.foldenable = false
  opt.formatoptions = { t = false }
  opt.hlsearch = true
  opt.ignorecase = true
  opt.incsearch = true
  opt.laststatus = 2
  opt.linebreak = true
  opt.mouse = "a"
  opt.number = true
  opt.relativenumber = true
  opt.ro = false
  opt.ruler = true
  opt.scrolloff = 3
  opt.shiftwidth = 2
  opt.shiftwidth = 2
  opt.sidescrolloff = 6
  opt.smartcase = true
  opt.smartindent = true
  opt.smarttab = true
  opt.softtabstop = 2
  opt.swapfile = false
  opt.synmaxcol = 400
  opt.tabstop = 2
  opt.termguicolors = true
  opt.ttyfast = true
  opt.visualbell = true
  opt.wildignore = { "*.o", "*.ob", "*vim/backups", "*~", "*sass-cache", "*DS_Store", "vendor/rails/**", "vendor/cache/**", "*.gem", "log/**", "tmp/**", "*.png", "*.jpg", "*.gif", "*/tmp/", "*/bin/", "*.so", "*.swp", "*.zip" }
  opt.wrap = true
  opt.wrapmargin = 0
