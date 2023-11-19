return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  keys = {
    '<leader><leader>',
    '<leader>ff',
    '<leader>fg',
    '<leader>fb',
    '<leader>fs',
    '<leader>fS',
    '<leader>fr',
    '<leader>fd'
  },
  config = function()
    local builtin = require('telescope.builtin')
    local utils = require('telescope.utils')

    -- Find git files if in git repo
    local project_files = function()
      local _, ret, _ = utils.get_os_command_output({'git', 'rev-parse', '--is-inside-work-tree'})
      if ret == 0 then
        builtin.git_files()
      else
        builtin.find_files()
      end
    end

    vim.keymap.set('n', '<leader><leader>', project_files, {})
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
    vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, {})
    vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
    vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
  end
}
