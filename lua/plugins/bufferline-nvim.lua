local dependencies = {
  'nvim-tree/nvim-web-devicons',
}

local keys = {
  { "n", "[b", "<cmd>BufferlineCycleNext<cr>", { desc = "Next Buffer", noremap = true, silent = true } },
  { "n", "]b", "<cmd>BufferlineCyclePrev<cr>", { desc = "Prev Buffer", noremap = true, silent = true } },
}

local config = function ()
  vim.opt.termguicolors = true
  require("bufferline").setup()
  vim.g.transparent_groups = vim.list_extend(
    vim.g.transparent_groups or {},
    vim.tbl_map(function(v)
      return v.hl_group
    end, vim.tbl_values(require('bufferline.config').highlights))
  )
end


local opts = {
  diagnostics_indicator = function(count, level, diagnostics_dict, context)
    local s = " "
    for e, n in pairs(diagnostics_dict) do
      local sym = e == "error" and " "
        or (e == "warning" and " " or "" )
      s = s .. n .. sym
    end
    return s
  end
}

return {
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    version = "*",
    dependencies = dependencies,
    keys = keys,
    config = config,
    opts = opts,
  },
}
