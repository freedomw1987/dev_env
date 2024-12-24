return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'onsails/lspkind-nvim',
    -- 'L3MON4D3/LuaSnip',
    -- 'rafamadriz/friendly-snippets',
    -- 'saadparwaiz1/cmp_luasnip'
  },
  config = function()
    local cmp = require('cmp')
    -- local luasnip = require("luasnip")

    cmp.setup({
      formatting = {
        format = require("lspkind").cmp_format({
          before = require("tailwind-tools.cmp").lspkind_format
        }),
      },
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
          -- luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'luasnip' }, -- For luasnip users.
        { name = 'vsnip' }, -- For vsnip users.
        {
          { name = 'buffer' }
        },
      })
    })
  end
}
