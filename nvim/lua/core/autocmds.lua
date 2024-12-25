local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd("BufEnter", {
  pattern = "*",
  command = "syntax sync fromstart",
})

autocmd({ "FileWritePost", "BufWritePost" }, {
  pattern = "*.less",
  callback = function()
    local cwd = vim.fn.expand("<afile>:p:h")
    local name = vim.fn.expand("<afile>:t:r")
    if vim.fn.executable("lessc") == 1 then
      vim.fn.system("lessc " .. cwd .. "/" .. name .. ".less > " .. cwd .. "/" .. name .. ".css &")
    end
  end,
})
