return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").lua_ls.setup({})
      require("lspconfig").pyright.setup({})
      require("lspconfig").ts_ls.setup({})
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          lua = {
            stylua = {
              command = "stylua",
              args = { "--indent-type=Spaces", "--indent-width=2", "--stdin-filepath", "$FILENAME", "-" },
              stdin = true
            },
          },
          protobuf = { "clang-format" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          yaml = { "prettier" },
          json = { "prettier" },
          css = { "prettier" },
          less = { "prettier" },
          sh = { "shfmt" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      })
    end,
  },
}
