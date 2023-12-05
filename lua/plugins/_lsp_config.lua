-- Load the required modules safely
local lsp_zero_status, lsp_zero = pcall(require, "lsp-zero")
local mason_status, mason = pcall(require, "mason")
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
local mason_null_ls_status, mason_null_ls = pcall(require, "mason_null_ls")
local mason_nvim_dap_status, mason_nvim_dap = pcall(require, "mason_nvim_dap")
local mason_tool_installer_status, mason_tool_installer = pcall(require, "mason-tool-installer")
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
local lspsaga_status, lspsaga = pcall(require, "lspsaga")
local dap_status, dap = pcall(require, "dap")
local dapui_status, dapui = pcall(require, "dapui")
local cmp_status, cmp = pcall(require, "cmp")
local luasnip_status, luasnip = pcall(require, "luasnip")
local lspkind_status, lspkind = pcall(require, "lspkind")
local formatter_status, formatter = pcall(require, "formatter")
local null_ls_status, null_ls = pcall(require, "null-ls")
local cmp_zsh_status, cmp_zsh = pcall(require, "cmp-zsh")
local deol_status, deol = pcall(require, "deol")
if
	not (
		lsp_zero_status
		and mason_status
		and mason_lspconfig_status
		and mason_null_ls_status
		and mason_nvim_dap_status
		and mason_tool_installer_status
		and lspconfig_status
		and lspsaga_status
		and dap_status
		and dapui_status
		and cmp_status
		and luasnip_status
		and lspkind_status
		and formatter_status
		and null_ls_status
		and cmp_zsh_status
		and deol_status
	)
then
	return
end

-- Set up lsp_zero
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)
Opt.signcolumn = "yes" -- Reserve space for diagnostic icons
lsp_zero.preset("recommended")
-- share options between serveral servers
local lsp_opts = {
	flags = {
		debounce_text_changes = 150,
	},
}
lsp_zero.setup_servers({
	"ansiblels",
	"bashls",
	"cssls",
	"dockerls",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	"sqlls",
	"tsserver",
	"vimls",
	"yamlls",
	opts = lsp_opts,
})
-- Next you call that function when the LSP server is attached to a buffer.
lsp_zero.on_attach(function(client, bufnr)
	print("LspAttached")
	lsp_zero.default_keymaps({ buffer = bufnr })
end)
lsp_zero.nvim_workspace()
lsp_zero.setup()
Vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})
lsp_zero.extend_cmp()

-- Set up mason
mason.setup({})

-- Set up mason_lspconfig
mason_lspconfig.setup({
	ensure_installed = {
		"java-language-server",
		"tsserver",
		"gopls",
		"bashls",
		"jsonls",
		"yamlls",
		"tomlls",
		"dockerls",
		"kubernetes",
		"sqlls",
		"git",
		"pyright",
		"ansiblels",
		"lua",
		"markdown",
		"xml",
		"powershell",
		"node",
		"bitbucket",
		"github",
		"viml",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			lspconfig.lua_ls.setup(lua_opts)
		end,
	},
})

-- Set up mason_null_ls
mason_null_ls.setup({})
-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Set up mason_nvim_dap
mason_nvim_dap.setup({})

-- Set up mason_tool_installer
mason_tool_installer.setup({
	-- a list of all tools you want to ensure are installed upon
	-- start
	ensure_installed = {

		-- you can pin a tool to a particular version
		-- { "golangci-lint", version = "v1.47.0" },

		-- you can turn off/on auto_update per tool
		{ "bash-language-server", auto_update = true },
		{ "zsh-language-server", auto_update = true },

		"lua-language-server",
		"vim-language-server",
		"java-language-server",
		"gopls",
		"golanggci-lint",
		"stylua",
		"shellcheck",
		"editorconfig-checker",
		"gofumpt",
		"golines",
		"gomodifytags",
		"gotests",
		"impl",
		"json-to-struct",
		"luacheck",
		"misspell",
		"revive",
		"shellcheck",
		"powershell",
		"shfmt",
		"staticcheck",
		"vint",
	},

	-- if set to true this will check each tool for updates. If updates
	-- are available the tool will be updated. This setting does not
	-- affect :MasonToolsUpdate or :MasonToolsInstall.
	-- Default: false
	auto_update = false,

	-- automatically install / update on startup. If set to false nothing
	-- will happen on startup. You can use :MasonToolsInstall or
	-- :MasonToolsUpdate to install tools and check for updates.
	-- Default: true
	run_on_start = true,

	-- set a delay (in ms) before the installation starts. This is only
	-- effective if run_on_start is set to true.
	-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
	-- Default: 0
	start_delay = 3000, -- 3 second delay

	-- Only attempt to install if 'debounce_hours' number of hours has
	-- elapsed since the last time Neovim was started. This stores a
	-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
	-- This is only relevant when you are using 'run_on_start'. It has no
	-- effect when running manually via ':MasonToolsInstall' etc....
	-- Default: nil
	debounce_hours = 5, -- at least 5 hours between attempts to install/update
})

-- Set up lspconfig
lspconfig.setup({})

-- Set up lspsaga
lspsaga.setup({})

-- Set up dap
dap.setup({})

-- Set up dapui
dapui.setup({})

-- Set up cmp
cmp.setup({
	sources = {
		{ name = "buffer" }, -- text within current buffer
		{ name = "git" },
		{ name = "luasnip" }, -- snippets
		{ name = "nvim_lsp" }, -- lsp
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "path" }, -- file system paths
		{ name = "rg" },
		{ name = "zsh" }, -- file system paths
		{
			name = "dictionary",
			keyword_length = 2,
		},
	},
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

-- Set up cmp-zsh
cmp_zsh.setup({
	zshrc = true, -- Source the zshrc (adding all custom completions). default: false
})

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
-- Set up luasnip
luasnip.setup({})

-- Set up lspkind
lspkind.init({})

-- Set up formatter
formatter.setup({})

-- Set up null-ls
-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		formatting.prettier, -- js/ts formatter
		formatting.stylua, -- lua formatter
		diagnostics.eslint_d.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
			end,
		}),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

-- Set up deol
deol.setup({})

Command("Format", function()
	vim.lsp.buf.format({ bufnr = bufnr })
end, {})
-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- format on save
	local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
	Autocmd("BufWritePre", {
		group = augroup_format,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end
