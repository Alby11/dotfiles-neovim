-- set colorscheme with protected call
-- in case it isn't installed
if Termguicolors then
	Opt.termguicolors = true
end

-- Overwrite transparent background for matherial theme
Cmd([[hi Normal guibg=NONE ctermbg=NONE]])

-- local status, _ = pcall(require, Colorscheme)
local status, _ = pcall(Cmd, string.format("colorscheme %s", Colorscheme))
if not status then
	print(string.format("Colorscheme %s not found! Using desert as a fallback...", Colorscheme)) -- print error if colorscheme not installed
	Cmd("colorscheme desert")
	return 1
end
require(string.format("plugins._%s", Colorscheme))
