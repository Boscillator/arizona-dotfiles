return {
  "SWilson4/valerie",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.termguicolors = false
    vim.cmd([[colorscheme valerie]])
    vim.o.background = 'dark'
  end
}
