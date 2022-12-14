local plugin_name = "lsp-zero"
if not CheckPlugin(plugin_name) then
	return
end

Vim.opt.signcolumn = "yes" -- Reserve space for diagnostic icons

local lsp = require(plugin_name)

lsp.preset("recommended")

lsp.ensure_installed({
	"ansiblels",
	"bashls",
	"cssls",
	"dockerls",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"pyright",
	"sqlls",
	"sumneko_lua",
	"tsserver",
	"yamlls",
	-- "java",
})
-- share options between serveral servers
local lsp_opts = {
	flags = {
		debounce_text_changes = 150,
	},
}

lsp.setup_servers({
	"ansiblels",
	"bashls",
	"cssls",
	"dockerls",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"pyright",
	"sqlls",
	"sumneko_lua",
	"tsserver",
	"yamlls",
	opts = lsp_opts,
})

-- Next you call that function when the LSP server is attached to a buffer.
lsp.on_attach(function(client, bufnr)
	-- Vim.call("LspAttached")
	print("LspAttached")
end)

lsp.nvim_workspace()

lsp.setup()

Vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})
