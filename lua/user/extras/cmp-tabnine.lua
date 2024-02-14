local M = {
    "tzachar/cmp-tabnine",
    event = "InsertEnter",
    build = "./install.sh",
    dependencies = 'hrsh7th/nvim-cmp'
}

function M.config() end

return M
