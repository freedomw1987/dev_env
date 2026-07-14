return {
  'saghen/blink.cmp',
  -- 加上這段依賴關係
  dependencies = {
    'saghen/blink.lib',
  },
  version = '*', -- 或者你原本指定的版本/分支
  opts = {
    -- 你原本的 blink.cmp 設定 ...
  }
}
