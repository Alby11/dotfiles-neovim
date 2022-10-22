local misc_aucmds = Augroup("misc_aucmds", { clear = true })
Autocmd("BufWinEnter", { group = misc_aucmds, command = "checktime" })
Autocmd("TextYankPost", {
  group = misc_aucmds,
  callback = function()
    vim.highlight.on_yank()
  end,
})

Cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END

  " " Deal with trailing spaces
  " highlight ExtraWhitespace ctermbg=red guibg=red
  " au ColorScheme * highlight ExtraWhitespace guibg=red
  " au BufEnter * match ExtraWhitespace /\s\+$/
  " au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  " au InsertLeave * match ExtraWhiteSpace /\s\+$/
  " autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  "
  " last-position-jump
  " This autocommand jumps to the last known position in a file
  " just after opening it, if the '" mark is set:
  " au BufReadPost *
  " \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  " \ |   exe "normal! g`\""
  " \ | endif

  " Set indentation to 2 spaces for yaml files
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab "

  " Set indentation to 4 spaces for py files
  autocmd FileType py setlocal ts=4 sts=4 sw=4 expandtab "
]])
