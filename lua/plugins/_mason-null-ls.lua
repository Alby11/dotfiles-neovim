local plugin_name = "mason-null-ls"

if not CheckPlugin(plugin_name) then
  return
end

local mason_null_ls = require(plugin_name)
mason_null_ls.setup({
    ensure_installed = {'stylua', 'shellcheck'},
    automatic_installation = true
})
