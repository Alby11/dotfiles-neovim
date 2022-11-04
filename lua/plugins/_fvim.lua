vim.cmd[[
  nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
  nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
  nnoremap <A-CR> :FVimToggleFullScreen<CR>

  " Cursor tweaks
  FVimCursorSmoothMove v:true
  FVimCursorSmoothBlink v:true

  " Background composition
  " FVimBackgroundComposition 'acrylic'
  " FVimBackgroundOpacity 0.85
  " FVimBackgroundAltOpacity 0.75
  " FVimBackgroundImage 'C:/foobar.png'
  " FVimBackgroundImageVAlign 'center'
  " FVimBackgroundImageHAlign 'center'
  " FVimBackgroundImageStretch 'fill'
  " FVimBackgroundImageOpacity 0.85

  " Title bar tweaks
  " FVimCustomTitleBar v:false

  " Debug UI overlay
  " FVimDrawFPS v:true

  " Font tweaks
  " FVimFontAntialias v:true
  " FVimFontAutohint v:true
  " FVimFontHintLevel 'full'
  " FVimFontLigature v:true
  " FVimFontLineHeight '+1.0'
  " FVimFontSubpixel v:true
  " FVimFontNoBuiltinSymbols v:false

  " Try to snap the fonts to the pixels reduces blur
  " in some situations (eg 100% DPI).
  " FVimFontAutoSnap v:true

  " Font weight tuning possible valuaes are 100..900
  FVimFontNormalWeight 100
  FVimFontBoldWeight 400

  " Font debugging  draw bounds around each glyph
  " FVimFontDrawBounds v:true

  " UI options (all default to false)
  " FVimUIPopupMenu v:true
  " FVimUIWildMenu v:false

  " Keyboard mapping options
  "FVimKeyDisableShiftSpace v:true
  "FVimKeyAutoIme v:true
  "FVimKeyAltGr v:true

  " Default options (workspace-agnostic)
  FVimDefaultWindowWidth 800
  FVimDefaultWindowHeight 600

  " Detach from a remote session without killing the server
  " If this command is executed on a standalone instance,
  " the embedded process will be terminated anyway.
  " FVimDetach

  " =========== BREAKING CHANGES -- the following commands are disabled ============
  " FVimUIMultiGrid v:true
  " FVimUITabLine v:false
  " FVimUICmdLine v:false
  " FVimUIMessages v:false
  " FVimUITermColors v:false
  " FVimUIHlState v:false
]]
