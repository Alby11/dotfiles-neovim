require("globals")
require("packer-config")
if is_vscode then
	require("basic-neovim")
	require("packer-use")
--	require("basic-vscode")
--	require("packer-vscode")
else
	require("basic-neovim")
	require("packer-use")
	require("colorscheme")
end
require("mappings")
require("commands")
require("autocommands")
require("packer-require")
require("filetype")
