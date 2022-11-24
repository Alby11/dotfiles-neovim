-- set colorscheme with protected call
-- in case it isn't installed
local status, _ = pcall(Cmd, string.format("colorscheme %s", Colorscheme))
if not status then
  print(string.format("Colorscheme %s not found! Using desert as a fallback...", Colorscheme)) -- print error if colorscheme not installed
  Cmd("colorscheme desert")
  return
end
