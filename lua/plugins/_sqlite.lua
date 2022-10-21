if is_win then
    vim.g.sqlite_clib_path = string.format("%s/databases/sqlite3.dll", Config_dir)
end
local sqlite = require("sqlite")
