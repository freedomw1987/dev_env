return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("tailwind-tools").setup({
      cmp = {
        highlight = "background", -- color preview style, "foreground" | "background"
      },
    })
  end

}
