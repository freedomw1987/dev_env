return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    "yggdroot/indentline",
    'vim-syntastic/syntastic'
  },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "javascript",
        "typescript",
        "python",
        "json",
        "lua",
        "php",
        "rust",
        "java",
        "vimdoc",
        "vimdoc",
        "c"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
    }
  end
}
