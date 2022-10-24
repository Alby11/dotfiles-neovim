local plugin_name = "cmp_zsh"

if not CheckPlugin(plugin_name) then
  return
end

require("cmp").setup({
  sources = {
    { name = "zsh" },
  },
})

require(plugin_name).setup({
  zshrc = true, -- Source the zshrc (adding all custom completions). default: false
  filetypes = { "deoledit", "zsh" }, -- Filetypes to enable cmp_zsh source. default: {"*"}
})
