local mapkey = require("util.keymapper").mapvimkey
local config = {
  function()
    local transparent = require("transparent")
    transparent.clear_prefix("lualine")
    transparent.clear_prefix("Bufferline")
    if config.transparent then
      vim.cmd("TransparentEnable")
    end
  end,
}
local opts = {
  -- lualine_style = "default",
  lualine_style = "stealth",
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal",
    "NeoTreeNormal",
    "NeoTreeFloatBorder",
    "NeoTreeNormalNC",
  },
}

return {
  {
    "xiyaowong/nvim-transparent",
    enabled = true,
    lazy = false,
    config = config,
    opts = opts,
  },
}
