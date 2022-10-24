local plugin_name = "lsp-zero"

if not CheckPlugin(plugin_name) then
  return
end

local lsp = require("plugin_name")
lsp.preset("recommended")
lsp.setup()
