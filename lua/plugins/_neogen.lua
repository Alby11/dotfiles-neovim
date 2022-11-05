local neogen = require 'neogen'

neogen.setup { enabled = true, jump_map = '<tab>' }
Map('n', '<localleader>d', '', {
  callback = function()
    require('neogen').generate()
  end,
  Opts,
})
Map('n', '<localleader>df', '', {
  callback = function()
    require('neogen').generate { type = 'func' }
  end,
  Opts,
})
Map('n', '<localleader>dc', '', {
  callback = function()
    require('neogen').generate { type = 'class' }
  end,
  Opts,
})
