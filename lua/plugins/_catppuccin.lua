local plugin_name = "catppuccin"

-- local status, packer = pcall(require, plugin_name)
if not CheckPlugin(plugin_name) then
  return
end

g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require(plugin_name).setup({
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.20,
  },
  transparent_background = true,
  term_colors = true,
  compile = {
    -- enabled = false,
    enabled = false,
    path = Stdpath("cache") .. "/catppuccin",
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    treesitter_context = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    coc_nvim = false,
    lsp_trouble = true,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    leap = false,
    telescope = true,
    nvimtree = false,
    neotree = {
      enabled = true,
      show_root = true,
      transparent_panel = true,
    },
    dap = {
      enabled = true,
      enable_ui = true,
    },
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    dashboard = false,
    neogit = true,
    vim_sneak = false,
    fern = false,
    barbar = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = true,
    notify = true,
    telekasten = true,
    symbols_outline = true,
    mini = false,
    aerial = false,
    vimwiki = true,
    beacon = false,
    navic = {
      enabled = false,
      custom_bg = "NONE",
    },
    overseer = false,
  },
  color_overrides = {},
  highlight_overrides = {},
})