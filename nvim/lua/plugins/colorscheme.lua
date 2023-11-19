return {
  "SWilson4/valerie",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.termguicolors = false
    vim.cmd([[colorscheme valerie]])
    vim.o.background = 'dark'

    -- Clear status bar hightlights
    vim.cmd([[highlight clear SignColumn]])
    vim.cmd([[highlight GitSignsAdd ctermfg=78 ctermbg=234]])
    vim.cmd([[highlight GitSignsDelete ctermfg=124 ctermbg=234]])
    vim.cmd([[highlight GitSignsChange ctermfg=78 ctermbg=234]])
  end
}
