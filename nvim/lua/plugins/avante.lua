return {
  "yetone/avante.nvim",
  event = "VeryLazy",

  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- add any opts here
    provider = "myazure",
    providers = {
      myazure = {
        __inherited_from = "azure",
        endpoint =
        "https://david-mavw41p7-eastus2.cognitiveservices.azure.com/",
        model = "model-router",
        deployment = "model-router", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
        api_key_name = "AZURE_OPENAI_API_KEY",
        api_version = "2024-12-01-preview",
        timeout = 30000, -- Timeout in milliseconds
        max_tokens = 8192,
      },
    }
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",      -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
