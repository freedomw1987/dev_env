return {
  'folke/lazydev.nvim',
  -- Same as `dependencies` but does not force the plugin to load
  specs = {
    { 'saghen/blink.cmp', opts = { sources = { default = { 'lazydev' } } } },
  },
}
