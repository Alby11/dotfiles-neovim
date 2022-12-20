local plugin_name = "lsp-zero"
if not CheckPlugin(plugin_name) then
	return
end

vim.opt.signcolumn = "yes" -- Reserve space for diagnostic icons

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

lsp.nvim_workspace()

lsp.setup()
