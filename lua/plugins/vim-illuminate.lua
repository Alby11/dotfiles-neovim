local mapkey = require("util.keymapper").mapvimkey
return {
	"RRethy/vim-illuminate",
	lazy = false,
	config = function()
		require("illuminate").configure({})
	end,
}
