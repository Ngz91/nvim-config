for opt, val in pairs({
  backspace = "indent,eol,start",
  breakindent = true,
  completeopt = "menuone,noselect,menu",
  conceallevel = 3,
  cursorlineopt = "number",
  diffopt = "internal,filler,closeoff,algorithm:patience",
  expandtab = true,
  fillchars = "fold: ,foldclose:,foldopen:,foldsep: ,diff: ,eob: ",
  fixendofline = false,
  foldexpr = "nvim_treesitter#foldexpr()",
  foldlevel = 99,
  foldmethod = "expr",
  formatoptions = "l",
  ignorecase = true,
  inccommand = "split",
  laststatus = 3,
  linebreak = true,
  mouse = "a",
  number = true,
  relativenumber = true,
  scrolloff = 10,
  shiftwidth = 0,
  showmode = false,
  signcolumn = "yes",
  smartcase = true,
  splitbelow = true,
  splitright = true,
  switchbuf = "useopen",
  tabstop = 2,
  termguicolors = true,
  textwidth = 120,
  undodir = vim.fn.expand("~/.cache/nvim/undodir"),
  undofile = true,
  viewoptions = "cursor,folds,slash,unix",
  wrap = false,
}) do
  vim.opt[opt] = val
end

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
