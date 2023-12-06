-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- cd to buffer
MapOpts.desc = "Cd to current buffer dir"
Map("n", "<leader>cd", "<cmd>cd %:h|pwd<cr>", MapOpts)

-- print current directory
MapOpts.desc = "Print working dir"
Map("n", "<leader>pwd", "<cmd>pwd<cr>", MapOpts)

-- ESC to normal mode
MapOpts.desc = "Esc to normal mode"
Map("i", "kj", [[<Esc>]], MapOpts)
Map("v", "kj", [[<Esc>]], MapOpts)
Map("t", "kj", [[<C-\><C-n>]], MapOpts)

-- save buffer
MapOpts.desc = "Write file"
Map("n", "<leader>qw", "<cmd>w<cr>", MapOpts)
MapOpts.desc = "Force write file"
Map("n", "<leader>qW", "<cmd>w!<cr>", MapOpts)

-- clean MapOpts desc
MapOpts.desc = nil
