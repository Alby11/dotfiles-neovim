local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = "lambdalisue/suda.vim",
}

function M.init()
    vim.o.timeout = true
    vim.o.timeoutlen = 100
end

function M.config()
  local mappings = {
    q = {
      name = "W/Q",
      q = { "<cmd>confirm q<CR>", "Quit" },
      gq = { "<cmd>confirm q!<CR>", "Quit (force)" },
      w = { "<cmd>confirm w<CR>", "Write" },
      W = { "<cmd>SudaWrite<CR>", "SudaWrite" },
      R = { "<cmd>SudaRead<CR>", "SudaRead" },
    },
    h = { "<cmd>nohlsearch<CR>", "NOHL" },
    [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
    v = { "<cmd>vsplit<CR>", "Split" },
    b = {
      name = "Buffers",
      o = { "<cmd>so %<cr>", "Source current buffer" },
      w = { "<cmd>Bwipeout<cr>", "Wipe current buffer" },
    },
    d = { name = "Debug" },
    f = { name = "Find" },
    g = { name = "Git" },
    l = { name = "LSP" },
    p = { name = "Plugins" },
    t = { name = "Test" },
    a = {
      name = "Tab",
      n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
      N = { "<cmd>tabnew %<cr>", "New Tab" },
      o = { "<cmd>tabonly<cr>", "Only" },
      h = { "<cmd>-tabmove<cr>", "Move Left" },
      l = { "<cmd>+tabmove<cr>", "Move Right" },
    },
    T = { name = "Treesitter" },
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M
