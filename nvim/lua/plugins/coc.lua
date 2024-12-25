return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    local function CheckBackspace()
      local col = vim.fn.col('.') - 1
      if col == 0 then
        return true
      else
        return vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end
    end

    vim.g.coc_global_extensions = {
      "coc-tsserver",
      "@yaegassy/coc-tailwindcss3",
      "coc-highlight",
      "coc-ci",
      "coc-syntax",
      "coc-html",
      "coc-snippets",
      "coc-prisma",
      "coc-docker",
      "coc-flutter",
      "coc-lua",
    }

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
    vim.keymap.set('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"',
      { silent = true, expr = true, noremap = true })
    vim.keymap.set('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"',
      { silent = true, expr = true, noremap = true })
    vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
    vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
    vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
    vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
    -- Remap keys for applying codeAction to the current line.
    vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction)', { silent = true })
    -- Apply AutoFix to problem on the current line.
    vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)', { silent = true })
    -- Run the Code Lens action on the current line.
    vim.keymap.set('n', '<leader>cl', '<Plug>(coc-codelens-action)', { silent = true })
  end
}
