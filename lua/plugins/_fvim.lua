vim.cmd([[
      " good old 'set guifont' compatibility with HiDPI hints...
      if g:fvim_os == 'windows' || g:fvim_render_scale > 1.0
        set guifont=CaskaydiaCove\ NF:h9,FiraCode\ NF:h9,Consolas:h9
      else
        set guifont=CaskaydiaCove\ NF:h9,FiraCode\ NF:h9,Consolas:h9
      endif
      " Ctrl-ScrollWheel for zooming in/out
      nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
      nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
      nnoremap <A-CR> :FVimToggleFullScreen<CR>
      FVimCursorSmoothMove v:true
      FVimCursorSmoothBlink v:true
  ]])
