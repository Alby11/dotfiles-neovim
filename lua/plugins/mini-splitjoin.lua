local config = {
  function ()
    require('mini.splitjoin').setup()
  end,
}
return {
  {
    'echasnovski/mini.splitjoin',
    version = false,
    lazy = false,
    config = config,
  },
}
