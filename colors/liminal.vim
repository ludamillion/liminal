" Copyright (c) 2020 Ling CHU <meetchuling@gmail.com>
" Copyright (c) 2020 Luke Inglis <ld.inglis@gmail.com>
"
" Permission to use, copy, modify, and distribute this software for any
" purpose with or without fee is hereby granted, provided that the above
" copyright notice and this permission notice appear in all copies.
"
" THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
" WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
" MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
" ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
" WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
" ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
" OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

if has('nvim')
  highlight! clear
  syntax reset
else
  if version > 580
    highlight! clear
    if exists('syntax_on')
      syntax reset
    endif
  endif
endif

if !(has('termguicolors') && &termguicolors) && !has('gui_running')
  finish
endif
" ---------------------------------------------------------------------
function! s:HL(group, ...) abort
  execute 'highlight! ' . a:group . ' ctermfg=NONE'
  execute 'highlight! ' . a:group . ' ctermbg=NONE'
  execute 'highlight! ' . a:group . ' cterm=NONE'

  let fg = get(a:, 1, '')
  let bg = get(a:, 2, '')
  let attr = get(a:, 3, '')

  if !empty(fg)
    execute 'highlight! ' . a:group . ' guifg=' . fg
  else
    echoerr 'no fg for ' . a:group
    return
  endif

  if !empty(bg)
    execute 'highlight! ' . a:group . ' guibg=' . bg
  else
    echoerr 'no bg for ' . a:group
    return
  endif

  if !empty(attr)
    execute 'highlight! ' . a:group . ' gui=' . attr
  else
    execute 'highlight! ' . a:group . ' gui=NONE'
  endif
endfunction

function! s:Link(from, to) abort
    execute 'highlight! link ' . a:from . ' ' . a:to
endfunction

" ---------------------------------------------------------------------
let g:colors_name = "liminal"

let s:bg = &background
" ---------------------------------------------------------------------
let s:colors = {}

if s:bg ==? 'dark'
  let s:colors = liminal#get_colors('dark')
else
  let s:colors = liminal#get_colors('light')
endif

" editor color scheme
" ----------------------------------------------------
call s:HL('ColorColumn', s:colors.background, s:colors.cursor_guide)
call s:HL('Conceal', s:colors.blue, s:colors.none)
call s:HL('Cursor', s:colors.cursor_fg, s:colors.cursor_bg)
call s:HL('CursorIM', s:colors.cursor_fg, s:colors.cursor_bg)
call s:HL('CursorColumn', s:colors.background, s:colors.cursor_guide)
call s:HL('CursorLine', s:colors.none, s:colors.none, s:colors.bold)
" ----------------------------------------------------
call s:HL('Directory', s:colors.cyan, s:colors.none)
" ----------------------------------------------------
call s:HL('DiffAdd', s:colors.background, s:colors.green)
call s:HL('DiffChange', s:colors.background, s:colors.yellow)
call s:HL('DiffDelete', s:colors.background, s:colors.red)
call s:HL('DiffText', s:colors.background, s:colors.magenta)

call s:HL('DiffAdded', s:colors.green, s:colors.background)
call s:HL('DiffChanged', s:colors.yellow, s:colors.background)
call s:HL('DiffRemoved', s:colors.red, s:colors.background)
" ----------------------------------------------------
call s:HL('EndOfBuffer', s:colors.background, s:colors.none)
" ----------------------------------------------------
call s:HL('ErrorMsg', s:colors.red, s:colors.none)
" ----------------------------------------------------
call s:HL('VertSplit', s:colors.split, s:colors.none)
" ----------------------------------------------------
call s:HL('Folded', s:colors.background, s:colors.magenta, s:colors.bold)
call s:HL('FoldColumn', s:colors.magenta, s:colors.none, s:colors.bold)
" ----------------------------------------------------
call s:HL('SignColumn', s:colors.none, s:colors.none)
call s:HL('IncSearch', s:colors.background, s:colors.magenta)
call s:HL('LineNr', s:colors.gray, s:colors.none)
call s:HL('CursorLineNr', s:colors.yellow, s:colors.none)
call s:HL('MatchParen', s:colors.red, s:colors.background)
" ----------------------------------------------------
call s:HL('ModeMsg', s:colors.foreground, s:colors.none)
call s:HL('MoreMsg', s:colors.green, s:colors.none)
call s:HL('NonText', s:colors.gray, s:colors.none)
" base color
call s:HL('Normal', s:colors.foreground, s:colors.background)
" ----------------------------------------------------
call s:HL('Pmenu', s:colors.win_fg, s:colors.win_bg)
call s:HL('PmenuSel', s:colors.win_fg, s:colors.selected_bg)
call s:HL('PmenuSbar', s:colors.none, s:colors.win_bg)
call s:HL('PmenuThumb', s:colors.none, s:colors.foreground)
" ----------------------------------------------------
call s:HL('Question', s:colors.red, s:colors.none)
" link it to normal
call s:HL('QuickFixLine', s:colors.foreground, s:colors.background)
call s:HL('Search', s:colors.background, s:colors.magenta)
call s:HL('SpecialKey', s:colors.gray, s:colors.none)
" ----------------------------------------------------
call s:HL('SpellBad', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('SpellCap', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('SpellLocal', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('SpellRare', s:colors.none, s:colors.none, s:colors.underline)
" ----------------------------------------------------
call s:HL('StatusLine', s:colors.win_fg, s:colors.selected_bg)
call s:HL('StatusLineNC', s:colors.gray, s:colors.none)
call s:HL('StatusLineTerm', s:colors.foreground, s:colors.none)
call s:HL('StatusLineTermNC', s:colors.gray, s:colors.none)
" ----------------------------------------------------
call s:HL('TabLine', s:colors.foreground, s:colors.none)
call s:HL('TabLineFill', s:colors.none, s:colors.none)
call s:HL('TabLineSel', s:colors.background, s:colors.cyan, s:colors.bold)
call s:HL('Terminal', s:colors.foreground, s:colors.background)
call s:HL('Title', s:colors.red, s:colors.none)
call s:HL('Visual', s:colors.selection_fg, s:colors.selection_bg)
call s:HL('VisualNOS', s:colors.selection_fg, s:colors.selection_bg)
call s:HL('WarningMsg', s:colors.red, s:colors.none)
call s:HL('WildMenu', s:colors.background, s:colors.cyan)

" standard syntax
" ----------------------------------------------------
call s:HL('Comment', s:colors.gray, s:colors.none, s:colors.italic)
" ----------------------------------------------------
call s:HL('Constant', s:colors.green, s:colors.none)
call s:HL('String', s:colors.yellow, s:colors.none)
call s:HL('Number', s:colors.cyan, s:colors.none)
call s:HL('Boolean', s:colors.cyan, s:colors.none)
call s:HL('Float', s:colors.cyan, s:colors.none)
" ----------------------------------------------------
call s:HL('Identifier', s:colors.blue, s:colors.none)
call s:HL('Function', s:colors.blue, s:colors.none)
" ----------------------------------------------------
call s:HL('Statement', s:colors.blue, s:colors.none, s:colors.bold)
call s:HL('Conditional', s:colors.cyan, s:colors.none, s:colors.bold)
call s:HL('Repeat', s:colors.cyan, s:colors.none, s:colors.bold)
call s:HL('Operator', s:colors.green, s:colors.none)
call s:HL('Keyword', s:colors.magenta, s:colors.none, s:colors.bold)
call s:HL('Exception', s:colors.cyan, s:colors.none, s:colors.bold)
" ----------------------------------------------------
call s:HL('PreProc', s:colors.cyan, s:colors.none)
call s:HL('Include', s:colors.cyan, s:colors.none)
call s:HL('Define', s:colors.blue, s:colors.none, s:colors.italic)
call s:HL('Macro', s:colors.blue, s:colors.none)
call s:HL('PreCondit', s:colors.green, s:colors.none)
" ----------------------------------------------------
call s:HL('Type', s:colors.green, s:colors.none)
call s:HL('StorageClass', s:colors.green, s:colors.none, s:colors.bold)
call s:HL('Structure', s:colors.magenta, s:colors.none, s:colors.bold)
call s:HL('Typedef', s:colors.green, s:colors.none, s:colors.bold)
" ----------------------------------------------------
call s:HL('Special', s:colors.cyan, s:colors.none)
" ----------------------------------------------------
call s:HL('Underlined', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('Ignore', s:colors.none, s:colors.none)
call s:HL('Error', s:colors.red, s:colors.none)
call s:HL('Todo', s:colors.yellow, s:colors.none)

" Help System
" ----------------------------------------------------
call s:HL('HelpExample', s:colors.yellow, s:colors.none)
call s:HL('HelpCommand', s:colors.yellow, s:colors.none)
call s:HL('HelpHyperTextEntry', s:colors.yellow, s:colors.none, s:colors.underline)

" coc.nvim
" ----------------------------------------------------
call s:HL('CocErrorSign', s:colors.red, s:colors.none)
call s:HL('CocWarningSign', s:colors.yellow, s:colors.none)
call s:HL('CocInfoSign', s:colors.green, s:colors.none)
call s:HL('CocHintSign', s:colors.gray, s:colors.none)
" ----------------------------------------------------
call s:HL('CocErrorHighlight', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('CocWarningHighlight', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('CocInfoHighlight', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('CocHintHighlight', s:colors.none, s:colors.none, s:colors.underline)

" vim-lsp
" ----------------------------------------------------
call s:HL('LspErrorText', s:colors.red, s:colors.none)
call s:HL('LspWarningText', s:colors.yellow, s:colors.none)
call s:HL('LspInformationText', s:colors.green, s:colors.none)
call s:HL('LspHintText', s:colors.gray, s:colors.none)
" ----------------------------------------------------
call s:HL('LspErrorHighlight', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('LspWarningHighlight', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('LspInformationHighlight', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('LspHintHighlight', s:colors.none, s:colors.none, s:colors.underline)

call s:HL('LspDiagnosticsDefaultError', s:colors.red, s:colors.none)
call s:HL('LspDiagnosticsSignError', s:colors.red, s:colors.none)
call s:HL('LspDiagnosticsUnderlineError', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('LspDiagnosticsVirtualTextError', s:colors.red, s:colors.none)

call s:HL('LspDiagnosticsDefaultWarning', s:colors.yellow, s:colors.none)
call s:HL('LspDiagnosticsSignWarning', s:colors.yellow, s:colors.none)
call s:HL('LspDiagnosticsUnderlineWarning', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('LspDiagnosticsVirtualTextWarning', s:colors.gray, s:colors.none, s:colors.underline)

call s:HL('LspDiagnosticsDefaultInformation', s:colors.blue, s:colors.none)
call s:HL('LspDiagnosticsSignInformation', s:colors.blue, s:colors.none)
call s:HL('LspDiagnosticsUnderlineInformation', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('LspDiagnosticsVirtualTextInformation', s:colors.gray, s:colors.none)

call s:HL('LspDiagnosticsDefaultHint', s:colors.cyan, s:colors.none)
call s:HL('LspDiagnosticsSignHint', s:colors.cyan, s:colors.none)
call s:HL('LspDiagnosticsUnderlineHint', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('LspDiagnosticsVirtualTextHint', s:colors.cyan, s:colors.none)

" ----------------------------------------------------
call s:HL('ALEErrorSign', s:colors.red, s:colors.none)
call s:HL('ALEWarningSign', s:colors.yellow, s:colors.none)
call s:HL('ALEInfoSign', s:colors.green, s:colors.none)
" ----------------------------------------------------
call s:HL('ALEError', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('ALEWarning', s:colors.none, s:colors.none, s:colors.underline)
call s:HL('ALEInfo', s:colors.none, s:colors.none, s:colors.underline)

" vim-signify/gitgutter
" ----------------------------------------------------
call s:HL('SignifySignAdd', s:colors.green, s:colors.none)
call s:HL('SignifySignChange', s:colors.yellow, s:colors.none)
call s:HL('SignifySignDelete', s:colors.red, s:colors.none)
" ----------------------------------------------------
call s:HL('GitGutterAdd', s:colors.green, s:colors.none)
call s:HL('GitGutterChange', s:colors.yellow, s:colors.none)
call s:HL('GitGutterDelete', s:colors.red, s:colors.none)

" rainbow
" ----------------------------------------------------
if !exists('g:rainbow_conf')
  let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
  let g:rainbow_conf['guifgs'] = [s:colors.cyan, s:colors.yellow, s:colors.red]
endif

" indentline
" ----------------------------------------------------
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:colors.split
endif

function SetLineHighlighting()
  if &l:rnu == 0 && &l:nu == 0
    call s:HL('CursorLine', s:colors.none, s:colors.none, s:colors.bold)
    call s:HL('CursorLineNr', s:colors.gray, s:colors.none)
  else
    call s:HL('CursorLine', s:colors.none, s:colors.none)
    call s:HL('CursorLineNr', s:colors.yellow, s:colors.none, s:colors.bold)
  endif
endfunction

augroup ModalCursorLine
  autocmd!
  autocmd OptionSet relativenumber call SetLineHighlighting()
  autocmd OptionSet number call SetLineHighlighting()
augroup end

" ---------------------------------------------------------------------
if has('nvim')
  let g:terminal_color_0 = s:colors.black
  let g:terminal_color_1 = s:colors.red
  let g:terminal_color_2 = s:colors.green
  let g:terminal_color_3 = s:colors.yellow
  let g:terminal_color_4 = s:colors.blue
  let g:terminal_color_5 = s:colors.magenta
  let g:terminal_color_6 = s:colors.cyan
  let g:terminal_color_7 = s:colors.white
  let g:terminal_color_8 = s:colors.gray
  let g:terminal_color_9 = s:colors.red
  let g:terminal_color_10 = s:colors.green
  let g:terminal_color_11 = s:colors.yellow
  let g:terminal_color_12 = s:colors.blue
  let g:terminal_color_13 = s:colors.magenta
  let g:terminal_color_14 = s:colors.cyan
  let g:terminal_color_15 = s:colors.white
elseif exists('*term_setansicolors')
  let g:terminal_ansi_colors = [
    \ s:colors.black,
    \ s:colors.red,
    \ s:colors.green,
    \ s:colors.yellow,
    \ s:colors.blue,
    \ s:colors.magenta,
    \ s:colors.cyan,
    \ s:colors.white,
    \ s:colors.gray,
    \ s:colors.red,
    \ s:colors.green,
    \ s:colors.yellow,
    \ s:colors.blue,
    \ s:colors.magenta,
    \ s:colors.cyan,
    \ s:colors.white,
    \ ]
endif

if s:bg ==? 'dark'
  set background=dark
else
  set background=light
endif

call SetLineHighlighting()
