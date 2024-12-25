return {
  'pseewald/vim-anyfold',
  config = function()
    vim.api.nvim_create_augroup("AnyFoldGroup", { clear = true })

    vim.api.nvim_create_autocmd("BufReadPost", {
      group = "AnyFoldGroup",
      callback = function()
        local bt = vim.bo.buftype
        local ft = vim.bo.filetype
        if ft == "TelescopePrompt" or ft == "NvimTree" or ft == nil or ft == "dashboard" or ft == "alpha" or bt == "nofile" then
          return
        end
        vim.cmd("AnyFoldActivate")
      end,
    })
  end

}
