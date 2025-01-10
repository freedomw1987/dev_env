local g = vim.g     -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped

opt.redrawtime = 15000
opt.hidden = true
opt.encoding = 'UTF-8'
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.background = 'dark'
opt.mouse = 'a'
opt.shiftwidth = 2
opt.backspace = { 'indent', 'eol', 'start' }
opt.foldlevel = 99
opt.autoread = true
opt.cursorline = true
opt.synmaxcol = 0
opt.laststatus = 3
opt.clipboard = 'unnamedplus'
opt.statusline:append('%#warningmsg#%{SyntasticStatuslineFlag()}%*')
opt.expandtab = true


g['tablineclosebutton'] = 1
g['NERDTreeMinimalUI'] = 1

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.cmd('syntax sync minlines=10000')
vim.cmd('syntax sync fromstart')
