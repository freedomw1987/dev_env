return {
  'saghen/blink.cmp',
  -- 加上這段依賴關係
  dependencies = {
    'saghen/blink.lib',
  },
  version = '*', -- 或者你原本指定的版本/分支
  opts = {
    -- 你原本的 blink.cmp 設定 ...
  },
  config = function()
    require('blink.cmp').setup({
      sources = {
        -- 1. 確保 default 列表中有 'lazydev'
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },

        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- 讓 lazydev 的補全順序排在最前面
          },
        },
      },
    })
  end
}
