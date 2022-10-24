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
    "nvim-treesitter/Highlight.lua",
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

  -- clipboard to sqlite
  use({
    "AckslD/nvim-neoclip.lua",
    requires = {
      "kkharji/sqlite.lua",
      config = GetSetup("sqlite"),
    },
    config = GetSetup("neoclip"),
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
        "sindrets/diffview.nvim",
        config = GetSetup("diffview"),
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
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
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
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "onsails/lspkind.nvim",
      "ray-x/lsp_signature.nvim",
      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "David-Kunz/cmp-npm",
      "Dosx001/cmp-commit",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      {
        "hrsh7th/cmp-nvim-lua",
        config = GetSetup("cmp-nvim-lua"),
      },
      "hrsh7th/cmp-path",
      "lukas-reineke/cmp-under-comparator",
      "petertriho/cmp-git",
      "saadparwaiz1/cmp_luasnip",
      {
        "tamago324/cmp-zsh",

        requires = "Shougo/deol.nvim",
        config = GetSetup("cmp_zsh"),
        cond = function()
          if is_win then
            return false
          end
        end,
      },
      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = GetSetup("lsp-zero"),
  })

  -- null_ls
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = GetSetup("null-ls"),
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
    cond = function()
      if is_win then
        return false
      end
    end,
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
      -- config = require("colorizer").setup(),
    },
  })

  -- Pretty UI
  use({
    {
      "catppuccin/nvim",
      as = "catppuccin",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "yamatsum/nvim-nonicons",
      },
      config = GetSetup("catppuccin"),
    },
    {
      "nvim-lualine/lualine.nvim",
      config = GetSetup("lualine"),
    },
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

  -- Firenvim
  use({
    "glacambre/firenvim",
    run = function()
      fn["firenvim#install"](0)
    end,
  })
end)
