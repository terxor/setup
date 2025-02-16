" --------------------------------
" Author: terxor
" License: The MIT License (MIT)
" 
" `xv3_light` theme (gui only)
" --------------------------------

set background=light
highlight clear
syntax reset

let s:bg = "#ffffff"
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

" call Hg("Comment", s:dark_green, "", "bold")
call HgF("Comment", s:red)

call HgF("Keyword", s:purple)

call HgF("String", s:alt_green)

call HgF("Number", s:yellow)

call HgF("Type", s:blue)  " C++ const, template, int, struct, void, namespace, typename, bool, char, auto, ...
call HgF("Function", s:blue)    " C++ ?
call HgF("Identifier", s:blue)  " C++ ?

call HgF("Constant", s:blue)   " C++ true/false, stderr, __VA_ARGS__, ...

call HgF("Statement", s:blue)     " C++ using, for, return, while, if, ...

call HgF("PreProc", s:purple)

call HgF("Operator", "#ff0000")
call HgF("Error", "#ff0000")
call HgF("Warning", "#ff0000")
call HgF("Todo", "#ff0000")
call HgF("LineNr", s:faded)

call Hg("Visual", "", "#cff0ff", "")

call Hg("Title", "#1a72ad", "", "bold")
call HgF("xv3_CodeBlock", "#aa77aa")
call HgF("xv3_Code", "#77aaaa")

hi link markdownH1                Title
hi link markdownCodeBlock         xv3_CodeBlock
hi link markdownCode              xv3_Code
hi link markdownHeadingDelimiter  Comment

