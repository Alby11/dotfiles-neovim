local mapkey = require("util.keymapper").mapvimkey

local cmd = {
	"TmuxNavigateLeft",
	"TmuxNavigateDown",
	"TmuxNavigateUp",
	"TmuxNavigateRight",
	"TmuxNavigatePrevious",
}

local keys = {
	mapkey("<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", "n"),
	mapkey("<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", "n"),
	mapkey("<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", "n"),
	mapkey("<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", "n"),
	mapkey("<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", "n"),
}

return {
	{
		"christoomey/vim-tmux-navigator",
		enabled = true,
		event = "VeryLazy",
		cmd = cmd,
		keys = keys,
	},
}
