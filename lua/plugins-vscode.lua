return Packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })

  use({
    "lewis6991/impatient.nvim",
    config = GetSetup("impatient"),
  })

  use({
    "elijahmanor/export-to-vscode.nvim",
    config = GetSetup("export-to-vscode"),
  })

  -- Movement
  use({
    {
      "phaazon/hop.nvim",
      branch = "v2", -- optional but strongly recommended
      config = GetSetup("hop"),
    },
    {
      "ethanholz/nvim-lastplace",
      config = GetSetup("nvim-lastplace"),
    },
  })

  -- Folding
  use({
    "kevinhwang91/nvim-ufo",
    requires = {
      "kevinhwang91/promise-async",
    },
    config = GetSetup("ufo"),
  })

  -- Commenting
  use({
    "numToStr/Comment.nvim",
    config = GetSetup("Comment"),
  })

  -- Wrapping/delimiters
  use({
    "tpope/vim-surround",
  })

  -- Text objects
  use({
    "wellle/targets.vim",
  })

  -- clipboard to sqlite
  use({
    "AckslD/nvim-neoclip.lua",
    requires = {
      "kkharji/sqlite.lua",
      config = GetSetup("sqlite"),
    },
    config = GetSetup("neoclip"),
  })
end)
