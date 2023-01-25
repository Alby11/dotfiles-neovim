return Packer.startup(function(use)
	-- THE plugin manager
	use("wbthomason/packer.nvim")

	-- speed up neovim startup
	use("lewis6991/impatient.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- Fancy icons
	use("kyazdani42/nvim-web-devicons")
	use("yamatsum/nvim-nonicons")

	-- Themes
	use("xiyaowong/nvim-transparent")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = GetSetup("catppuccin"),
		-- 	cond = false,
		-- "dracula/vim",
		-- "Mofiqul/dracula.nvim",
		-- as = "dracula",
		-- config = GetSetup("dracula"),
	})

	-- UI plugins
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})
	use("elijahmanor/export-to-vscode.nvim")

	-- Buffer management
	use("romgrk/barbar.nvim")
	-- use("mhinz/vim-sayonara")

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	-- Movement
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})
	use("ethanholz/nvim-lastplace")

	-- Commenting
	use("numToStr/Comment.nvim")

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- Text objects
	use("wellle/targets.vim")

	-- Folding
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
	})

	-- Indentation tracking
	use("lukas-reineke/indent-blankline.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"BurntSushi/ripgrep",
			"nvim-lua/plenary.nvim",
			"cljoly/telescope-repo.nvim",
			"jvgrootveld/telescope-zoxide",
			"nvim-telescope/telescope-packer.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
		},
	})

	-- Path navigation
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	-- Session management
	use("jedrzejboczar/possession.nvim")

	-- Project browsing
	use("ahmedkhalf/project.nvim")

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use({
		"tamago324/cmp-zsh",
		requires = "Shougo/deol.nvim",
		cond = function()
			return not Is_win
		end,
	})
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
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use("MunifTanjim/prettier.nvim")

	-- REPL
	use({ "hkupty/iron.nvim" })

	-- Ansible
	use("pearofducks/ansible-vim")

	-- golang dev
	use({
		"fatih/vim-go",
		run = ":GoInstallBinaries",
	})

	-- LSPZERO
	use({
		"VonHeikemen/lsp-zero.nvim",
		after = "vim-go",
		config = function()
			local lsp = require("lsp-zero")
			lsp.preset("recommended")
			lsp.setup()
		end,
	})

	-- DAP
	use({
		"mfussenegger/nvim-dap",
		"jayp0521/mason-nvim-dap.nvim",
	})
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("nvim-treesitter/nvim-treesitter-context")

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	}) -- autoclose tags

	-- git integration
	use("tpope/vim-fugitive")
	-- use("dinhhuy258/git.nvim")
	use("lewis6991/gitsigns.nvim")
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Quickfix
	use("folke/trouble.nvim")

	-- misc
	use({
		"lambdalisue/suda.vim",
		cond = function()
			return not Is_win
		end,
	})
	use("winston0410/cmd-parser.nvim")
	-- highlight range written in cmeline
	use("winston0410/range-highlight.nvim")
	-- Highlight colors
	use("norcalli/nvim-colorizer.lua")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- toggle terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
	})

	-- nvim cheatsheet
	use({ "sudormrfbin/cheatsheet.nvim" })

	-- keymap hints
	use("folke/which-key.nvim")

	-- redirect ex output to buffer
	use("sbulav/nredir.nvim")

	if Packer_bootstrap then
		require("packer").sync()
	end
end)
