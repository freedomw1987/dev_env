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
  -- lint
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint");
      lint.linters_by_ft = {
        python = { "flake8" },
        lua = { "luacheck" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>l", ":lua vim.diagnostic.open_float()<CR>", { silent = true })
    end
  },
  -- conform formatter
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
