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
    let cmd .= " gui=" . a:style
  else
    let cmd .= " gui=none"
  endif
  execute cmd
endfunction

function! HgF(group, guifg)
  call Hg(a:group, a:guifg, "", "")
endfunction

" call Hg("Normal", s:fg, s:bg, "")

" Status line color on active/inactive buffers 
call Hg("StatusLine",   "#bfe0ff",  "#000000", "")
call Hg("StatusLineNC", "#cccccc",  "#000000", "")

call Hg("CursorLine",   "",         "#efefe7",  "none")
call Hg("CursorLineNr", "",         "#efefe7",  "none")

" highlight Visual ctermbg=darkblue ctermfg=white guibg=#f2e9c9 guifg=#000000

call Hg("VertSplit", s:fg, s:bg, "")

let s:faded = "#80827e"
let s:blue = "#0f6da3"
let s:green = "#547d2a"
let s:dark_green = "#6bc90c"
let s:alt_green = "#619e23"
let s:yellow = "#ba8c00"
let s:purple = "#3d2687"
let s:dark_brown =  "#4f0e02"
let s:brown =  "#8a5345"
let s:unset =  "#00ff00"
let s:teal = "#3f8f8b"
let s:red = "#8c1c1c"
let s:warn_bg = "#fde293"
let s:warn_fg = "#ea8600"

" call Hg("Comment", s:dark_green, "", "bold")
call HgF("Comment", s:red)

call HgF("Keyword", s:purple)

call HgF("String", s:green)

call HgF("Number", s:yellow)

call HgF("Type", s:blue)          " C++ const, template, int, struct, void, namespace, typename, bool, char, auto, ...
call HgF("Function", s:blue)      " C++ ?
call HgF("Identifier", s:blue)    " C++ ?
call HgF("Constant", s:blue)      " C++ true/false, stderr, __VA_ARGS__, ...
call HgF("Statement", s:blue)     " C++ using, for, return, while, if, ...

" Statement is problematic -> bold

call HgF("PreProc", s:purple)

call Hg("MatchParen", "", s:warn_bg, "")

call HgF("Operator", "#ff0000")
call HgF("Error", "#ff0000")
call HgF("Warning", "#ff0000")
call Hg("Todo", s:red, s:bg, "bold")
call HgF("LineNr", s:faded)

call Hg("Visual", "", "#cff0ff", "")

call HgF("Title", s:red)
call HgF("xv3_CodeBlock", s:blue)
call Hg("xv3_BoldTitle", s:red, "", "bold")
call HgF("xv3_Code", s:purple)
call HgF("xv3_Faded", s:faded)
call HgF("xv3_WarnFg", s:warn_fg)
call Hg("xv3_Warn", "", s:warn_bg, "")

hi link markdownH1                Title
hi link markdownCodeBlock         xv3_CodeBlock
hi link markdownCode              xv3_Code
hi link markdownHeadingDelimiter  Normal
hi link markdownRule              xv3_Faded
hi link markdownBlockquote        String
" disable em and strong to prevent unintended styling
hi link markdownEmphasis          Normal
hi link markdownStrong            Normal
hi link markdownLongLine          xv3_WarnFg
hi link markdownError             xv3_Warn

