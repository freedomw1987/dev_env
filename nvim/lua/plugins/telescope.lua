return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local theme = require('telescope.themes')
    local opts = theme.get_ivy({})
    local builtin = require('telescope.builtin');
    vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files(opts)
      end,
      {
        desc = 'Telescope find files',
      })
    vim.keymap.set('n', '<leader>fw', function()
        builtin.live_grep(opts)
      end
      ,
      {
        desc = 'Telescope live grep'
      })
  end
}
