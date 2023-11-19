return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  keys = {
    '<leader><leader>',
    '<leader>ff'
  },
  config = function()
    local builtin = require('telescope.builtin')
    local utils = require('telescope.utils')

    -- Find git files if in git repo
    local project_files = function()
      local _, ref, _ = utils.get_os_command_output({'git', 'rev-parse', '--is-inside-work-tree'})
      if ret == 0 then
        builtin.git_files()
      else
        builtin.find_files()
      end
    end

    vim.keymap.set('n', '<leader><leader>', project_files, {})
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  end
}
