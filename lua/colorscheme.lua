-- set colorscheme with protected call
-- in case it isn't installed
-- local status, _ = pcall(Cmd, string.format("colorscheme %s", Colorscheme))
local status, _ = pcall(require, Colorscheme)
-- if not status thea
-- 	print(string.format("Colorscheme %s not found! Using desert as a fallback...", Colorscheme)) -- print error if colorscheme not installed
-- 	Cmd("colorscheme desert")
-- 	return 1
-- end
require(string.format("plugins._%s", Colorscheme))
