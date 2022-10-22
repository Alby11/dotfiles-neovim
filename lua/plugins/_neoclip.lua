local plugin_name = "neoclip"

if not CheckPlugin(plugin_name) then
  return
end

require(plugin_name).setup({
  history = 1000,
  -- enable_persistent_history = false,
  enable_persistent_history = true,
  length_limit = 1048576,
  -- continuous_sync = false,
  continuous_sync = true,
  -- db_path = Config_dir .. "/databases/neoclip.sqlite3",
  db_path = string.format("%s/databases/%s.sqlite3", Config_dir, plugin_name),
  filter = nil,
  preview = true,
  default_register = '"',
  default_register_macros = "q",
  enable_macro_history = true,
  content_spec_column = true,
  on_paste = {
    set_reg = true,
  },
  on_replay = {
    set_reg = false,
  },
  keys = {
    telescope = {
      i = {
        select = "<cr>",
        paste = "<c-p>",
        paste_behind = "<c-k>",
        replay = "<c-q>", -- replay a macro
        delete = "<c-d>", -- delete an entry
        custom = {},
      },
      n = {
        select = "<cr>",
        paste = "p",
        --- It is possible to map to more than one key.
        -- paste = { 'p', '<c-p>' },
        paste_behind = "P",
        replay = "q",
        delete = "d",
        custom = {},
      },
    },
  },
})

if not Is_vscode then
  require("telescope").load_extension(plugin_name)
  Map("n", "<leader>tn", string.format(":Telescope %s<cr>", plugin_name), Opts)
end
