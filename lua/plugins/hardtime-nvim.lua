local mapkey = require("util.keymapper").mapvimkey
local dependencies = {
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",
}
return {
	"m4xshen/hardtime.nvim",
	enabled = true,
	lazy = true,
	command = "Hardtime",
	event = "BufEnter",
	dependencies = dependencies,
	opts = {},
}
