-- Ensure packer is installed
local ensure_packer = function()
  local install_path = Stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if Fn.empty(Fn.glob(install_path)) > 0 then
    Fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    Cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

CheckPlugin = function(pluginID)
  local status, pluginID = pcall(require, pluginID)
  if status then
    return true
  end
  print(string.format("%s is not installed", pluginID))
  return false
end

if CheckPlugin("packer") then
  Packer = require("packer")
  Util = require("packer.util")
  Init = Packer.init
else
  local packer_bootstrap = ensure_packer()
end

Init({
  display = {
    open_fn = function()
      local result, win, buf = Util.float({
        border = {
          { "╭", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╮", "FloatBorder" },
          { "│", "FloatBorder" },
          { "╯", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╰", "FloatBorder" },
          { "│", "FloatBorder" },
        },
      })
      Api.nvim_win_set_option(win, "winhighlight", "NormalFloat:Normal")
      return result, win, buf
    end,
  },
  log = { level = "warn" }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error",
})

---- Automatically set up your configuration after cloning packer.nvim
if packer_bootstrap then
  Packer.install()
end

cmd([[colorscheme slate]])

if CheckPlugin("catppuccin") then
  cmd([[colorscheme catppuccin]])
end

if CheckPlugin("notify") then
  Notify = require("notify")
  Notify.setup({
    stages = "fade",
    background_colour = "FloatShadow",
    timeout = 3000,
  })
  -- show a notification when PackerCompile finishes
  autocmd("User", {
    pattern = "PackerCompileDone",
    callback = function()
      Notify("PackerCompile done", "info")
    end,
  })
end

-- PackerCompile on save if your config file is in plugins.lua or catppuccin.lua
Autocmd("BufWritePost", {
  pattern = { "plugins-neovim.lua" },
  callback = function()
    -- vim.cmd("source %")
    Cmd("PackerCompile")
  end,
})

get_setup = function(name)
  return string.format("require('plugins._%s')", name)
end

Get_setup = function(name)
  return string.format("require('plugins._%s')", name)
end

Packer.reset()

if is_win then
  require("plugins-win")
  return
end

if is_vscode then
  require("plugins-vscode")
  return
end

require("plugins-lin")