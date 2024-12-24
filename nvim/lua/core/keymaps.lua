-----------------------------------------------------------
----- Define keymaps of Neovim and installed plugins.
--------------------------------------------------------------
---
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end
local function imap(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end
local function vmap(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

local function CheckBackspace()
  local col = vim.fn.col('.') - 1
  if col == 0 then
    return true
  else
    return vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end
end

vim.g.mapleader = ' '

-- Save
map('n', '<C-s>', ':w<CR>')
-- NERDTree
map('n', '<leader>e', ':NvimTreeToggle<CR>')
map('n', '<leader><Left>', ':vertical resize -5<CR>')
map('n', '<leader><Right>', ':vertical resize +5<CR>')

-- Vsplit
map('n', '<leader>vs', ':vsplit<CR>')
map('n', '<leader>ss', ':split<CR>')
map('n', '<leader>x', ':close<CR>')

-- Tabs
map('n', '<leader>to', ':tabnew<CR>')
map('n', '<leader>tx', ':tabclose<CR>')
map('n', '<tab>', ':tabn<CR>')
map('n', '<S-Tab>', ':tabp<CR>')
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')

-- Floaterm git
map('n', '<leader>gg', ':FloatermNew --height=1.0 --width=1.0  lazygit<CR>')

-- FZF
nmap('<leader>ff', ':GFiles<CR>')
nmap('<leader>fw', ':Ag<CR>')


-- Coc
vim.keymap.set('i', '<Tab>',
  function()
    if vim.fn['coc#pum#visible']() == 1 then
      return vim.fn['coc#pum#next'](1)
    elseif CheckBackspace() then
      return "\t"
    else
      return vim.fn['coc#refresh']()
    end
  end,
  { noremap = true, silent = true, expr = true }
)
imap('<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', { silent = true, expr = true, noremap = true })
imap('<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', { silent = true, expr = true, noremap = true })
nmap('gd', '<Plug>(coc-definition)', { silent = true })
nmap('gy', '<Plug>(coc-type-definition)', { silent = true })
nmap('gi', '<Plug>(coc-implementation)', { silent = true })
nmap('gr', '<Plug>(coc-references)', { silent = true })
-- Remap keys for applying codeAction to the current line.
nmap('<leader>ac', '<Plug>(coc-codeaction)', { silent = true })
-- Apply AutoFix to problem on the current line.
nmap('<leader>qf', '<Plug>(coc-fix-current)', { silent = true })
-- Run the Code Lens action on the current line.
nmap('<leader>cl', '<Plug>(coc-codelens-action)', { silent = true })

-- Search
nmap('<leader>rg', ':Rg<CR>')
vim.api.nvim_set_keymap('', '/', '<Plug>(incsearch-forward)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '?', '<Plug>(incsearch-backward)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'g/', '<Plug>(incsearch-stay)', { noremap = true, silent = true })

-- Codeium
map('i', '<C-g>', 'codeium#Accept()', { expr = true, silent = true, nowait = true, script = true })
map('i', '<C-h>', 'codeium#AcceptNextWord()', { expr = true, silent = true, nowait = true, script = true })
map('i', '<C-j>', 'codeium#AcceptNextLine()', { expr = true, silent = true, nowait = true, script = true })
map('i', '<C-;>', '<Cmd>call codeium#CycleCompletions(1)<CR>', { silent = true })
map('i', '<C-,>', '<Cmd>call codeium#CycleCompletions(-1)<CR>', { silent = true })
map('i', '<C-x>', '<Cmd>call codeium#Clear()<CR>', { silent = true })

-- Move lines
nmap('K', '<Cmd>m .-2<CR>==')
nmap('J', '<Cmd>m .+1<CR>==')
vmap('K', ":m '<-2<CR>gv=gv")
vmap('J', ":m '>+1<CR>gv=gv")
imap('jk', "<Esc>", { noremap = true })

-- Copy and paste to clipboard
vmap('<C-c>', '"+y', { noremap = true })
map('', '<C-p>', '"+p', { noremap = true , silent = true })

