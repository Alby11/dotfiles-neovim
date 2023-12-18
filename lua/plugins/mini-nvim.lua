local mapkey = require("util.keymapper").mapvimkey
local config = function()
	require("mini.ai").setup()
	require("mini.animate").setup()
	require("mini.bufremove").setup()
	require("mini.cursorword").setup()
	-- require("mini.indentscope").setup()
	require("mini.jump2d").setup()
	require("mini.misc").setup()
	require("mini.operators").setup()
	require("mini.splitjoin").setup()
	require("mini.trailspace").setup()
end

return {
	{
		"echasnovski/mini.nvim",
		version = false,
		lazy = false,
		config = config,
	},
}
