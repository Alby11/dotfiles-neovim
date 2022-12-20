-- set colorscheme with protected call
-- in case it isn't installed
if Termguicolors then
	Opt.termguicolors = true
	Opt.background = "dark"
end
local status, _ = pcall(Cmd, string.format("colorscheme %s", Colorscheme))
if not status then
	print(string.format("Colorscheme %s not found! Using desert as a fallback...", Colorscheme)) -- print error if colorscheme not installed
	Cmd("colorscheme industry")
	return 1
end
-- dunno why but it's the only way to get transparent background but I loose
-- theming in other plugins
-- Autocmd("BufWinEnter", { group = misc_aucmds, command = 'lua require("plugins._bufferline")' })
-- Autocmd("BufWinEnter", { group = misc_aucmds, command = 'lua require("plugins._lualine")' })
-- Autocmd("BufWinEnter", { group = misc_aucmds, command = string.format("colorscheme %s", Colorscheme) })
local pluginConfigFile = string.format("%s/_%s.lua", Plugins_dir, Colorscheme)
if not Exists(pluginConfigFile) then
	return 0
end
-- require(string.format("plugins._%s", Colorscheme))
