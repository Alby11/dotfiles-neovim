local mapkey = require("util.keymapper").mapvimkey
return {
	"m4xshen/hardtime.nvim",
	enabled = true,
	command = "Hardtime",
	event = "BufEnter",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {},
}
