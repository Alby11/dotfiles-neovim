local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.selection = "exclusive"
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.modifiable = true

Opt.guicursor = {
	"n-v:block-Cursor", -- Normal and Visual mode - Block cursor with custom color
	"i:ver25-CursorI", -- Insert mode - Vertical bar 25% width with a different color
	"c:hor20", -- Command-line mode - Horizontal bar 20% width
	"r-cr:hor20-CursorR", -- Replace mode - Horizontal bar 20% width with unique color
	"o:hor50", -- Operator-pending mode - Horizontal bar 50% width
	"a:blinkwait700-blinkoff400-blinkon250", -- Blink settings for all modes
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Select mode - Block with different blink rate
}

-- Optionally, you can define custom colors for Cursor, CursorI, CursorR in your colorscheme or separately
-- For example:
Cmd([[highlight Cursor guifg=#ffccff guibg=#1e1e2e]]) -- Mauve for Normal Mode
Cmd([[highlight CursorI guifg=#f5c2e7 guibg=#1e1e2e]]) -- Pink for Insert Mode
Cmd([[highlight CursorR guifg=#a6e3a1 guibg=#1e1e2e]]) -- Green for Replace Mode

opt.encoding = "UTF-8"
opt.showmode = false

-- folds
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
