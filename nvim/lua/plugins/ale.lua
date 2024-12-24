return {
  'dense-analysis/ale',
  config = function()
    vim.g.ale_completion_enabled = 0
    vim.g.ale_fix_on_save = 1
    vim.g.ale_linters_explicit = 1
    vim.g.ale_fixers = {
      html = { 'prettier' },
      css = { 'stylelint' },
    }
    vim.g.ale_linters = {
      html = { 'htmlhint' },
      css = { 'stylelint' },
    }
  end
}
