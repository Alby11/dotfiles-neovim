-- Functional wrapper for mapping custom keybindings
if is_vscode then
  Map("n", "z=", "vim.fn.VSCodeNotify('keyboard-quickfix.openQuickFix')<cr>", Opts)
end

-- toggle search highlight
Cmd([[
    nnoremap <silent><expr> <Leader>HH (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
]])

-- toggle spell check
Mapv("n", "<Leader>SS", function()
  O.spell = not O.spell
  print(string.format("spell: %s", tostring(O.spell)))
end, Opts)

-- Quit, close buffers, etc.
Map("n", "<leader>q", "<cmd>q<cr>", Opts)
Map("n", "<leader>qa", "<cmd>qa<cr>", Opts)
Map("n", "<leader>Q", "<cmd>q!<cr>", Opts)
Map("n", "<leader>QA", "<cmd>qa!<cr>", Opts)
Map("n", "<leader>x", "<cmd>x!<cr>", Opts)

-- Save buffer
Map("i", "<c-s>", "<esc><cmd>w<cr>a", Opts)
Map("n", "<leader>w", "<cmd>w<cr>", Opts)
Map("n", "<leader>W", "<cmd>w!<cr>", Opts)
Map("n", "<leader>sw", "<cmd>SudaWrite<cr>", Opts)

-- Read buffer
Map("n", "<leader>sr", "<cmd>SudaRead<cr>", Opts)

-- Esc
Map("i", "kj", [[<Esc>]], Opts)
Map("v", "kj", [[<Esc>]], Opts)
Map("c", "kj", [[<C-C>]], Opts)
Map("t", "kj", [[<C-\><C-n>]], Opts)

-- Yank to clipboard
Map("n", "y+", "<cmd>set opfunc=util#clipboard_yank<cr>g@", Opts)
Map("v", "y+", "<cmd>set opfunc=util#clipboard_yank<cr>g@", Opts)

-- Window movement
Map("n", "<c-h>", "<c-w>h", Opts)
Map("n", "<c-j>", "<c-w>j", Opts)
Map("n", "<c-k>", "<c-w>k", Opts)
Map("n", "<c-l>", "<c-w>l", Opts)

 	-- restart lsp server (not on youtube nvim video)
	Map("n", "<leader>lspr", ":LspRestart<CR>", Opts) -- mapping to restart lsp if necessary

-- Tab movement
-- Map("n", "<c-Left>", "<cmd>tabpre<cr>", Opts)
-- Map("n", "<c-Right>", "<cmd>tabnext<cr>", Opts)

-- Dot-Repeat in Vim and Neovim
-- https://www.vikasraj.dev/blog/vim-dot-repeat
-- function _G.__dot_repeat(motion)
--   local is_visual = string.match(motion or "", "[vV]") -- 2.
--
--   if not is_visual and motion == nil then
--     vim.o.operatorfunc = "v:lua.__dot_repeat"
--     return "g@"
--   end
--
--   if is_visual then
--     print("VISUAL mode")
--   else
--     print("NORMAL mode")
--   end
--
--   local range = { -- 3.
--     starting = vim.api.nvim_buf_get_mark(0, is_visual and "<" or "["),
--     ending = vim.api.nvim_buf_get_mark(0, is_visual and ">" or "]"),
--   }
--
--   print(vim.inspect(range))
-- end
--
-- vim.keymap.set("n", "gt", _G.__dot_repeat, { expr = true })
-- vim.keymap.set("x", "gt", "<ESC><CMD>lua _G.__dot_repeat(vim.fn.visualmode())<CR>") -- 1.
