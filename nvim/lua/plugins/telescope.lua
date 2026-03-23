return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'nvim-telescope/telescope-media-files.nvim'
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    }
  },
  config = function()
    local theme = require('telescope.themes')
    local opts = theme.get_ivy({
      hidden = true,
      file_ignore_patterns = { "%node_modules/", "%.git/", "%.DS_Store", "composer.phar", "composer.lock" }
    })
    local builtin = require('telescope.builtin')
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
