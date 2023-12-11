local opts = {
	ensure_installed = {
		"awk_ls",
		"bashls",
		"clangd",
		"cmake",
		"cssls",
		"cssmodules_ls",
		"dockerls",
		"efm",
		"emmet_ls",
		"eslint",
		"gopls",
		"html",
		"java_language_server",
		"jsonls",
		"lua_ls",
		"marksman",
		"mutt_ls",
		"powershell_es",
		"pyright",
		"solidity",
		"sqlls",
		"tailwindcss",
		"tsserver",
		"vimls",
		"yamlls",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
