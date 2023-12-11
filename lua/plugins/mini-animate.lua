local config = function ()
  require("mini.animate").setup()
end

return {
  {
    'echasnovski/mini.animate',
    version = false,
    lazy = false,
    config = config,
  },
}
