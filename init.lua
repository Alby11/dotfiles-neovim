require("globals")
require("plugins-config")
if is_vscode then
	require("plugins-vscode")
	require("basic-vscode")
else
	require("plugins-use")
	require("basic-neovim")
	require("colorscheme")
end
require("mappings")
require("commands")
require("autocommands")
require("plugins._export-to-vscode")
require("plugins-require")
