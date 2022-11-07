require("globals")
if is_vscode then
  require("basic-vscode")
  require("mappings")
  require("plugins-config")
  require("plugins-vscode")
else
  require("basic-neovim")
  require("autocommands")
  require("commands")
  require("mappings")
  require("plugins-config")
  require("plugins-use")
end
