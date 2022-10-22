local plugin_name = "toggleterm"

if not CheckPlugin(plugin_name) then return end

require(plugin_name).setup()

function _G.set_terminal_keymaps()
  Map("t", "<esc>", [[<C-\><C-n>]], Opts)
  Map("t", "jk", [[<C-\><C-n>]], Opts)
  Map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], Opts)
  Map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], Opts)
  Map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], Opts)
  Map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], Opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- Cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
Cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")


Map("n", "<Leader>st", "<Cmd>ToggleTerm<CR>", Opts)
