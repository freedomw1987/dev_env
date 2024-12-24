return {
  'dense-analysis/ale',
  config = function()
    vim.g.syntastic_always_populate_loc_list = 1
    vim.g.syntastic_auto_loc_list = 1
    vim.g.syntastic_check_on_open = 1
    vim.g.syntastic_check_on_wq = 0
    vim.g.syntastic_aggregate_errors = 1

    vim.g.ale_completion_enabled = 0
    vim.g.ale_fix_on_save = 1
    vim.g.ale_linters_explicit = 1
    vim.g.ale_fixers = {
      html= {'prettier'},
      css= {'stylelint'},
    }
    vim.g.ale_linters = {
      html= {'htmlhint'},
      css= {'stylelint'},
    }
  end
}
