return {
  'pseewald/vim-anyfold',
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = "*",
      command = "AnyFoldActivate",
    })
  end

}
