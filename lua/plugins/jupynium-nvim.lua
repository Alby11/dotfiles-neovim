local dependencies = {
  "rcarriga/nvim-notify",   -- optional
  "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect }
  {
    "hrsh7th/nvim-cmp",
  }
}

return {
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    dependencies = dependencies,
  }
}
