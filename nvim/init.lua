local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins")
require("statusline")

-- Identation
vim.o.expandtab = true
vim.o.smartident = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Line numbers
vim.o.number = true
vim.o.ruler = true

-- Keybinds
-- Change Buffers
vim.keymap.set('n', '<s-l>', '<Cmd>bnext<CR>', {})
vim.keymap.set('n', '<s-h>', '<Cmd>bprev<CR>', {})

-- Change Windows
vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-j>', '<C-w>j', {})
vim.keymap.set('n', '<C-k>', '<C-w>k', {})
vim.keymap.set('n', '<C-l>', '<C-w>l', {})

-- Omnifunc
vim.keymap.set('i', '<C-space>', '<C-x><C-o>', { desc = "autocomplete" })
