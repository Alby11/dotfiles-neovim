return Packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	use("lewis6991/impatient.nvim")

	use("elijahmanor/export-to-vscode.nvim")

	-- Buffer management
	use({
		"romgrk/barbar.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	-- say sayonara to buffers
	use("mhinz/vim-sayonara")

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
			"nvim-telescope/telescope-file-browser.nvim",
			"ahmedkhalf/project.nvim",
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
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})

	use("kosayoda/nvim-lightbulb")

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
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	-- golang dev
	-- use({
	-- 	"fatih/vim-go",
	-- 	run = ":GoInstallBinaries",
	-- })
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
	use("nvim-treesitter/nvim-treesitter-context")

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
	}) -- autoclose tags

	-- git integration
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

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
	-- Highlight chunk of code
	use("folke/twilight.nvim")
	-- Highlight colors
	use("norcalli/nvim-colorizer.lua")

	-- Pretty UI
	use("kyazdani42/nvim-web-devicons")
	use("yamatsum/nvim-nonicons")
	-- Themes
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"yamatsum/nvim-nonicons",
		},
		cond = false,
	})
	use({
		"dracula/vim",
		as = "dracula",
		cond = true,
	})
	-- status line
	use("nvim-lualine/lualine.nvim")

	-- other ui plugins
	use("b0o/incline.nvim")
	use("stevearc/dressing.nvim")
	use("rcarriga/nvim-notify")
	use("vigoux/notifier.nvim")
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
	})

	-- nvim cheatsheet
	use({
		"sudormrfbin/cheatsheet.nvim",
		requires = {
			"nvim-lua/popup.nvim",
		},
	})

	-- keymap hints
	use("folke/which-key.nvim")
	use("sbulav/nredir.nvim")

	if Packer_bootstrap then
		require("packer").sync()
	end
end)
