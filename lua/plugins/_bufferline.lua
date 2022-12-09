local plugin_name = "bufferline"
if not CheckPlugin(plugin_name) then
	return
end

-- Move to previous/next
Map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", Opts)
Map("n", "<A-.>", "<Cmd>BufferNext<CR>", Opts)
-- Re-order to previous/next
-- Map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", Opts)
-- Map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", Opts)
-- Goto buffer in position...
-- Map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", Opts)
-- Map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", Opts)
-- Map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", Opts)
-- Map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", Opts)
-- Map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", Opts)
-- Map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", Opts)
-- Map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", Opts)
-- Map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", Opts)
-- Map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", Opts)
-- Map("n", "<A-0>", "<Cmd>BufferLast<CR>", Opts)
-- Pin/unpin buffer
-- Map("n", "<A-p>", "<Cmd>BufferPin<CR>", Opts)
-- Close buffer
-- Map('n', '<A-c>', '<Cmd>BufferClose<CR>', Opts)
Map("n", "<A-c>", "<Cmd>Bdelete<CR>", Opts)

-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
Map("n", "<C-p>", "<Cmd>BufferPick<CR>", Opts)
-- Sort automatically by...
Map("n", "<Leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", Opts)
Map("n", "<Leader>bd", "<Cmd>BufferOrderByDirectory<CR>", Opts)
Map("n", "<Leader>bl", "<Cmd>BufferOrderByLanguage<CR>", Opts)
Map("n", "<Leader>bn", "<Cmd>BufferOrderByWindowNumber<CR>", Opts)
Map("n", "<Leader>br", "<Cmd>BufferWipeout<CR>", Opts)
-- Map("n", "<Leader>bw", "<Cmd>BufferWipeout<CR>", Opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- Set barbar's options
require(plugin_name).setup({
	-- Enable/disable animations
	animation = true,

	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = true,

	-- Enable/disable current/total tabpages indicator (top right corner)
	tabpages = true,

	-- Enable/disable close button
	closable = true,

	-- Enables/disable clickable tabs
	--  - left-click: go to buffer
	--  - middle-click: delete buffer
	clickable = true,

	-- Excludes buffers from the tabline
	-- exclude_ft = { "javascript" },
	-- exclude_name = { "package.json" },

	-- Enable/disable icons
	-- if set to 'numbers', will show buffer index in the tabline
	-- if set to 'both', will show buffer index and icons in the tabline
	-- icons = true,
	icons = "both",

	-- If set, the icon color will follow its corresponding buffer
	-- highlight group. By default, the Buffer*Icon group is linked to the
	-- Buffer* group (see Highlighting below). Otherwise, it will take its
	-- default value as defined by devicons.
	icon_custom_colors = false,

	-- Configure icons on the bufferline.
	icon_separator_active = "▎",
	icon_separator_inactive = "▎",
	icon_close_tab = "",
	icon_close_tab_modified = "●",
	icon_pinned = "車",

	-- If true, new buffers will be inserted at the start/end of the list.
	-- Default is to insert after current buffer.
	insert_at_end = false,
	insert_at_start = false,

	-- Sets the maximum padding width with which to surround each tab
	maximum_padding = 1,

	-- Sets the maximum buffer name length.
	maximum_length = 30,

	-- If set, the letters for each buffer in buffer-pick mode will be
	-- assigned based on their name. Otherwise or in case all letters are
	-- already assigned, the behavior is to assign letters in order of
	-- usability (see order below)
	semantic_letters = true,

	-- New buffer letters are assigned in this order. This order is
	-- optimal for the qwerty keyboard layout but might need adjustement
	-- for other layouts.
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

	-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
	-- where X is the buffer number. But only a static string is accepted here.
	no_name_title = nil,
})
