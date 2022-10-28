local plugin_name = "lsp-zero"

if not CheckPlugin(plugin_name) then
  return
end

Lsp = require(plugin_name)
Lsp.preset("recommended")
Lsp.nvim_workspace()
Lsp.setup()
