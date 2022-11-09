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

  -- Wrapping/delimiters
  use({
    "tpope/vim-surround",
  })

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

  -- Treesitter
  use({
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = GetSetup("nvim-treesitter"),
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-refactor",
    {
      "nvim-treesitter/Highlight.lua",
      cond = function () return not Is_win end,
    },
    "RRethy/nvim-treesitter-endwise",
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

  -- Git stuff
  use({
    {
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = GetSetup("gitsigns"),
    },
    {
      "TimUntersberger/neogit",
      requires = {
        "nvim-lua/plenary.nvim",
        {
          "sindrets/diffview.nvim",
          config = GetSetup("diffview"),
        },
      },
      config = GetSetup("neogit"),
    },
    {
      "akinsho/git-conflict.nvim",
      tag = "*",
      config = function()
        require("git-conflict").setup()
      end,
    },
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

  -- golang dev
  use({
    "fatih/vim-go",
    run = ":GoInstallBinaries",
  })

  use({
    "kosayoda/nvim-lightbulb",
  })

  -- LSP Support
  -- lsp-zero, nvim-cmp, LuaSnipplu
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        as = "mason",
        before = {
          "null-ls",
          "mason-null-ls",
        }
      },
      "williamboman/mason-lspconfig.nvim",
      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    as = "lsp-zero",
    before = {
      "null-ls",
      "mason-null-ls",
    },
    config = GetSetup("lsp-zero"),
  })
  -- other, lsp related, plugins
  use({
      "onsails/lspkind.nvim",
      "ray-x/lsp_signature.nvim",
      -- Autocompletion
      "David-Kunz/cmp-npm",
      "Dosx001/cmp-commit",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "lukas-reineke/cmp-under-comparator",
      "petertriho/cmp-git",
      {
        "tamago324/cmp-zsh",

        requires = "Shougo/deol.nvim",
        config = GetSetup("cmp_zsh"),
        cond = function () return not Is_win end,
      },
  })
  -- null-ls
  use({
    "jose-elias-alvarez/null-ls.nvim",
    as = "null-ls",
    after = "lsp-zero",
    before = "mason-null-ls",
  })
  -- mason-null-ls
  use({
    "jayp0521/mason-null-ls.nvim",
    after = "null-ls",
    as = "mason-null-ls",
    config = function ()
      require("mason").setup()
      require("null-ls").setup()
      require("mason-null-ls").setup()
      GetSetup("null-ls")
      GetSetup("mason-null-ls")
    end
  })

  -- Quickfix
  use({
    "folke/trouble.nvim",
    config = GetSetup("trouble"),
  })

  -- Debugger
  use({
    "mfussenegger/nvim-dap",
    requires = {
      "Pocco81/dap-buddy.nvim",
      {
        "rcarriga/nvim-dap-ui",
        config = GetSetup("dapui"),
      },
    },
    config = GetSetup("dap"),
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

end)
