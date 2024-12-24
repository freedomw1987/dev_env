return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
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
  end
}
