local keys = {
  { 'n', '<leader>Zn', '<cmd>SudaRead<CR>', { desc = "Sudo read file" } },
  { 'n', '<leader>Zw', '<cmd>SudaWrite<CR>', { desc = "Sudo write file" } },
}
return {
  -- Suda to sudo
  {
    "lambdalisue/suda.vim",
    lazy = false,
    keys = keys,
  },
}
