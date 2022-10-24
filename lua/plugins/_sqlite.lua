local plugin_name = "sqlite"

if not CheckPlugin(plugin_name) then return end

if is_win then
    vim.g.sqlite_clib_path = string.format("%s/databases/sqlite3.dll", Config_dir)
--    Cmd[[let g:sqlite_clib_path=stdpath("config") . '/databases/sqlite3.dll']]
end
local sqlite = require(plugin_name)
