local config = {
  function ()
    local wk = require("which-key")
    wk.register({
      Z = {
        name = "+Suda", -- optional group name
        -- r = { "<cmd>SudaRead<cr>", "Suda read", noremap=true, silent = true }, -- additional options for creating the keymap
        -- w = { "<cmd>SudaWrite<cr>", "Suda write", noremap=true, silent = true }, -- additional options for creating the keymap
        -- ["a"] = "which_key_ignore",  -- special label to hide it in the popup
      },
    }, { prefix = "<leader>" })
  end,
}

return {
	"folke/which-key.nvim",
	lazy = false,
  init = function ()
    vim.o.timeout = true
    vim.o.timeoutlen = 100
  end,
  config = config,
	opts = {},
}
