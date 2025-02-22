" --------------------------------
" Author: terxor
" License: The MIT License (MIT)
" 
" `xv3_light` theme (gui only)
" --------------------------------

set background=light
highlight clear
syntax reset

" Colors
let s:alt_green  = "#619e23"
let s:bg         = "#fffff7"
let s:blue       = "#0f6da3"
let s:brown      = "#8a5345"
let s:dark_brown = "#4f0e02"
let s:dark_green = "#6bc90c"
let s:faded      = "#80827e"
let s:fg         = "#404040"
let s:green      = "#547d2a"
let s:grey       = "#cff0ff"
let s:lblue      = "#bfe0ff"
let s:lgrey      = "#cccccc"
let s:off_white  = "#efefe7"
let s:purple     = "#3d2687"
let s:red        = "#8c1c1c"
let s:teal       = "#3f8f8b"
let s:unset      = "#00ff00"
let s:warn_bg    = "#fde293"
let s:warn_fg    = "#ea8600"
let s:yellow     = "#ba8c00"

let s:bold = "bold"
let s:none = "none"

function! HgS(group, fg, bg, style)
  let cmd = "highlight " . a:group
  if a:fg != ""
    let cmd .= " guifg=" . a:fg
  endif
  if a:bg != ""
    let cmd .= " guibg=" . a:bg
  endif
  if a:style != ""
    let cmd .= " gui=" . a:style
    let cmd .= " cterm=" . a:style
  else
    let cmd .= " gui=none"
    let cmd .= " cterm=none"
  endif
  execute cmd
endfunction

function! HgF(group, guifg)
  call HgS(a:group, a:guifg, "", "")
endfunction

function! HgB(group, guibg)
  call HgS(a:group, "", a:guibg, "")
endfunction

call HgS("Normal", s:fg, s:bg, "")
call HgS("StatusLine", s:fg,  s:lblue, "") " Status line color on active/inactive buffers 
call HgS("StatusLineNC", s:fg, s:lgrey, "")
call HgS("CursorLine",   "", s:off_white, "")
call HgS("CursorLineNr", s:red, s:off_white, "")
call HgS("VertSplit", s:fg, s:off_white, "")
call HgF("Comment", s:red)
call HgF("Keyword", s:purple)
call HgF("String", s:green)
call HgF("Number", s:yellow)
call HgF("Type", s:blue)          " C++ const, template, int, struct, void, namespace, typename, bool, char, auto, ...
call HgF("Function", s:blue)      " C++ ?
call HgF("Identifier", s:blue)    " C++ ?
call HgF("Constant", s:blue)      " C++ true/false, stderr, __VA_ARGS__, ...
call HgF("Statement", s:blue)     " C++ using, for, return, while, if, ...
call HgF("PreProc", s:purple)
call HgB("MatchParen", s:warn_bg)
call HgS("Todo", s:red, s:bg, s:bold)
call HgF("LineNr", s:faded)
call HgB("Visual", s:warn_bg)
call HgF("Title", s:red)
call HgB("Search", s:warn_bg)
call HgB("EndOfBuffer", s:lgrey)

call HgF("xv3_CodeBlock", s:blue)
call HgS("xv3_BoldTitle", s:red, "", s:bold)
call HgF("xv3_Code", s:purple)
call HgF("xv3_Faded", s:faded)
call HgF("xv3_WarnFg", s:warn_fg)
call HgS("xv3_Warn", "", s:warn_bg, "")

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

set fillchars=eob:\ ,vert:\  " note U+FF5C 
