return {
  -- Suda to sudo
  {
    "lambdalisue/suda.vim",
    keys = {
      -- Save buffer
      { "<leader>Sw", "<cmd>SudaWrite<cr>", { desc = "Suda write", MapOpts } },
      -- Read buffer
      { "<leader>Sr", "<cmd>SudaRead<cr>", { desc = "Suda read", MapOpts } },
    },
    dependencies = {
      "folke/which-key.nvim",
      opts = {
        defaults = {
          mode = { "n", "v" },
          ["<leader>S"] = { name = "+Suda" },
        },
      },
    },
  },
}
