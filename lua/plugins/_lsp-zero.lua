local plugin_name = "lsp-zero"

if not CheckPlugin(plugin_name) then
  return
end

Lsp = require(plugin_name)
Lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = "local",
  sign_icons = {
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "",
  },
})
Lsp.nvim_workspace()
Lsp.setup()
