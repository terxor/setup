" --------------------------------
" Author: terxor
" License: The MIT License (MIT)
" 
" `xv3_light` theme (gui only)
" --------------------------------

set background=light
highlight clear
syntax reset

let s:bg = "#fffff7"
let s:fg = "#404040"

" Highlight only for gui
function! Hg(group, guifg, guibg, style)
  let cmd = "highlight " . a:group
  if a:guifg != ""
    let cmd .= " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd .= " guibg=" . a:guibg
  endif
  if a:style != ""
    let cmd .= " cterm=" . a:style
  endif
  execute cmd
endfunction

function! HgF(group, guifg)
  call Hg(a:group, a:guifg, "", "")
endfunction


" Let the terminal control the defaults
" call Hg("Normal", s:fg, s:bg, "")

" Status line color on active/inactive buffers 
call Hg("StatusLine",   "#bfe0ff",  "#000000", "")
call Hg("StatusLineNC", "#cccccc",  "#000000", "")

call Hg("CursorLine",   "",         "#efefe7",  "none")
call Hg("CursorLineNr", "",         "#efefe7",  "none")

" highlight Visual ctermbg=darkblue ctermfg=white guibg=#f2e9c9 guifg=#000000

call Hg("VertSplit", "#fffff7", "#cfcfc7", "")

let s:faded = "#80827e"

call HgF("Comment", s:faded)
call HgF("Keyword", "#ff0000")
call HgF("String", "#547d2a")
call HgF("Number", "#ba8c00")
call HgF("Type", "#0f6da3")
call HgF("Function", "#ff0000")
call HgF("Identifier", "#4f0e02")
call HgF("Constant", "#ff0000")
call HgF("Statement", "#ff0000")
call HgF("PreProc", "#ff0000")
call HgF("Operator", "#ff0000")
call HgF("Error", "#ff0000")
call HgF("Warning", "#ff0000")
call HgF("Todo", "#ff0000")
call HgF("LineNr", s:faded)

call Hg("Visual", "", "#cff0ff", "")
