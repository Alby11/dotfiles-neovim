return Packer.startup(function(use)

  use({ "wbthomason/packer.nvim" })

  -- lua functions that many plugins use
  use( { "nvim-lua/plenary.nvim" } )

  use({
    "lewis6991/impatient.nvim",
    config = GetSetup("impatient"),
  })

  use({
    "elijahmanor/export-to-vscode.nvim",
    config = GetSetup("export-to-vscode"),
  })

  -- Buffer management
  use({
    "romgrk/barbar.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = GetSetup("bufferline"),
  })
  -- say sayonara to buffers
  use({
    "mhinz/vim-sayonara",
    config = GetSetup("sayonara"),
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

  -- Commenting
  use({
    "numToStr/Comment.nvim",
    config = GetSetup("Comment"),
  })

  -- essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- Text objects
  use({
    "wellle/targets.vim",
  })

  -- Folding
  use({
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    config = GetSetup("ufo"),
  })

  -- Indentation tracking
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = GetSetup("indent_blankline"),
  })


  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "BurntSushi/ripgrep",
      "nvim-lua/plenary.nvim",
      "cljoly/telescope-repo.nvim",
      "jvgrootveld/telescope-zoxide",
      "nvim-telescope/telescope-file-browser.nvim",
      {
        "ahmedkhalf/project.nvim",
        config = GetSetup("project_nvim"),
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
    },
    config = GetSetup("telescope"),
  })

  -- Path navigation
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = GetSetup("neo-tree"),
  })


  use({
    "kosayoda/nvim-lightbulb",
  })

-- autocompletion
  use({
    "hrsh7th/nvim-cmp",
    config = GetSetup("cmp"),
  }) -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  -- golang dev
  use({
    "fatih/vim-go",
    run = ":GoInstallBinaries",
  })
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use({
    "windwp/nvim-autopairs",
    config = GetSetup("nvim-autopairs"),
  }) -- autoclose parens, brackets, quotes, etc... 

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use({
    {
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = GetSetup("gitsigns"),
    },
    {
      "akinsho/git-conflict.nvim",
      tag = "*",
      config = function()
        require("git-conflict").setup()
      end,
    },
  })

  -- Quickfix
  use({
    "folke/trouble.nvim",
    config = GetSetup("trouble"),
  })

  -- misc
  use({
    "lambdalisue/suda.vim",
    cond = function () return not Is_win end,
  })
  use({
    "winston0410/cmd-parser.nvim",
    -- highlight range written in cmeline
    {
      "winston0410/range-highlight.nvim",
      config = GetSetup("range-highlight"),
    },
    -- Highlight chunk of code
    {
      "folke/twilight.nvim",
      config = GetSetup("twilight"),
    },
    -- Highlight colors
    {
      "norcalli/nvim-colorizer.lua",
      config = GetSetup("colorizer"),
    },
  })

  -- Pretty UI
  use({
        "kyazdani42/nvim-web-devicons",
        "yamatsum/nvim-nonicons",
  })
  -- Themes
  use({
    {
      "catppuccin/nvim",
      as = "catppuccin",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "yamatsum/nvim-nonicons",
      },
      cond = false,
      config = GetSetup("catppuccin"),
    },
    {
      "dracula/vim",
      cond = true,
      config = GetSetup("dracula"),
    },
    -- status line
    {
      "nvim-lualine/lualine.nvim",
      config = GetSetup("lualine"),
    },
    -- other ui plugins
    {
      "b0o/incline.nvim",
      config = GetSetup("incline"),
    },
    "stevearc/dressing.nvim",
    "rcarriga/nvim-notify",
    "vigoux/notifier.nvim",
  })

  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  })

  -- toggle terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
    config = GetSetup("toggleterm"),
  })

  -- nvim cheatsheet
  use({
    "sudormrfbin/cheatsheet.nvim",
    requires = {
      "nvim-lua/popup.nvim",
    },
  })
  -- keymap hints
  use({
    "folke/which-key.nvim",
    config = GetSetup("which-key"),
  })

  if packer_bootstrap then
    require("packer").sync()
  end

end)
