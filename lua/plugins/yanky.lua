return {
  -- yanky and sqlite are managed as LazyVim extras
  -- but you need to initialize yanky on your own
  {
    "kkharji/sqlite.lua",
    lazy = false,
    dependencies =
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({})
      require("telescope").load_extension("yank_history")
    end,
    opts = {
      storage = "sqlite",
    },
    dependencies = {
      "hrsh7th/nvim-cmp",
      opts = {
        sources = {
          name = "cmp_yanky",
          option = {
            -- only suggest items which match the current filetype
            -- onlyCurrentFiletype = false,
            -- only suggest items with a minimum length
            minLength = 3,
          },
        },
      },
      ----@param opts cmp.ConfigSchema
      -- opts = function(_, opts)
        -- table.insert(opts.sources, {
          -- name = "cmp_yanky",
          -- option = {
            -- only suggest items which match the current filetype
            -- onlyCurrentFiletype = false,
            -- only suggest items with a minimum length
            -- minLength = 3,
          -- },
        -- })
      -- end,
    },
  },
  },
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)"),
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)"),
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)"),
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)"),
vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)"),
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)"),
vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)"),
vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)"),
vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)"),
vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)"),
vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)"),
vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)"),
vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)"),
vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)"),
vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)"),
vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)"),
}
