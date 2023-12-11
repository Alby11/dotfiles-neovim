local config = {
 function ()
    require('mini.cursorword').setup()
  end,
}

return {
  {
    'echasnovski/mini.cursorword',
    version = false,
    lazy = false,
    config = config,
  },
}
