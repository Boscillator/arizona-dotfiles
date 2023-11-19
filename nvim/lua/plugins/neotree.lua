return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true,
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  opts = {
    close_if_last_window = true
  },
  init = function()
    vim.keymap.set('n','<leader>fe','<Cmd>:Neotree<CR>', {})
  end
}
