return {
  "junegunn/fzf.vim",
  event = "VeryLazy",
  dependencies = {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end
  },
  config = function()
    vim.g.syntastic_always_populate_loc_list = 1
    vim.g.syntastic_auto_loc_list = 1
    vim.g.syntastic_check_on_open = 1
    vim.g.syntastic_check_on_wq = 0
    vim.g.syntastic_aggregate_errors = 1
  end
}
