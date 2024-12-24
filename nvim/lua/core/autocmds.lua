local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd("FileType", {
  pattern = "*",
  command = "AnyFoldActivate",
})
autocmd("BufEnter", {
  pattern = "*",
  command = "syntax sync fromstart",
})

local autoformat_group = augroup("autoformat_settings", { clear = true })
autocmd("FileType", {
  group = autoformat_group,
  pattern = "c,cpp,proto,java",
  command = "AutoFormatBuffer clang-format",
})
autocmd("FileType", {
  group = autoformat_group,
  pattern = "javascriptreact,typescriptreact,yaml,lua",
  command = "AutoFormatBuffer prettier",
})
autocmd("FileType", {
  group = autoformat_group,
  pattern = "css,less,scss",
  command = "AutoFormatBuffer js-beautify",
})
autocmd("FileType", {
  group = autoformat_group,
  pattern = "sh",
  command = "AutoFormatBuffer shfmt",
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
