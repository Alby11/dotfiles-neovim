require("globals")
require("plugins-config")
if is_vscode then
	require("basic-vscode")
	require("plugins-vscode")
else
	require("basic-neovim")
	require("plugins-use")
	require("colorscheme")
end
require("mappings")
require("commands")
require("autocommands")
require("plugins-require")
