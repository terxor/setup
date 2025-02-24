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
" let s:alt_green  = "#619e23"
" let s:bg         = "#fffff7"
" let s:blue       = "#0f6da3"
" let s:brown      = "#8a5345"
" let s:dark_brown = "#4f0e02"
" let s:dark_green = "#6bc90c"
" let s:faded      = "#80827e"
" let s:fg         = "#404040"
" let s:green      = "#547d2a"
" let s:grey       = "#cff0ff"
" let s:lblue      = "#bfe0ff"
" let s:lgrey      = "#cccccc"
" let s:off_white  = "#efefe7"
" let s:purple     = "#3d2687"
" let s:red        = "#8c1c1c"
" let s:teal       = "#3f8f8b"
" let s:unset      = "#00ff00"
" let s:warn_bg    = "#fde293"
" let s:warn_fg    = "#ea8600"
" let s:yellow     = "#ba8c00"
" let s:amber     = "#ffffd7"
"
let s:alt_green  = "106"
let s:bg         = "231"
let s:blue       = "24"
let s:brown      = "131"
let s:dark_brown = "52"
let s:dark_green = "70"
let s:faded      = "102"
let s:fg         = "238"
let s:green      = "64"
let s:grey       = "195"
let s:lblue      = "153"
let s:lgrey      = "252"
let s:off_white  = "254"
let s:purple     = "56"
let s:red        = "88"
let s:teal       = "30"
let s:unset      = "10"
let s:warn_bg    = "222"
let s:warn_fg    = "214"
let s:yellow     = "136"
let s:amber      = "230"
let s:lpurple    = "189"
let s:alt_purple = "60"

let s:b_green = "194"
let s:b_yellow = "229"
let s:b_red = "217"

let s:bold = "bold"
let s:none = "none"

function! HgS(group, fg, bg, style)
  let cmd = "highlight " . a:group
  if a:fg != ""
    let cmd .= " ctermfg=" . a:fg
  endif
  if a:bg != ""
    let cmd .= " ctermbg=" . a:bg
  endif
  if a:style != ""
    " let cmd .= " gui=" . a:style
    let cmd .= " cterm=" . a:style
  else
    " let cmd .= " gui=none"
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

call HgS("Normal", s:fg, s:bg, s:none)
call HgS("StatusLine", s:fg,  s:lpurple, s:bold) " Status line color on active/inactive buffers 
call HgS("StatusLineNC", s:bg, s:alt_purple, "")
call HgS("CursorLine",   "", s:amber, "")
call HgS("CursorLineNr", s:red, s:amber, "")
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
call HgB("EndOfBuffer", s:bg)

call HgF("xv3_CodeBlock", s:blue)
call HgS("xv3_BoldTitle", s:red, "", s:bold)
call HgF("xv3_Code", s:purple)
call HgF("xv3_Faded", s:faded)
call HgF("xv3_WarnFg", s:warn_fg)
call HgS("xv3_Warn", "", s:warn_bg, "")

call HgS("DiffAdd", s:green, s:b_green, "")
call HgS("DiffDelete", s:b_red, s:b_red, s:none)
call HgS("DiffChange", "", s:b_yellow, "")
call HgS("DiffText", "", s:warn_bg, "")

" call HgS("SignColumn", "", s:warn_bg, "")
call HgS("FoldColumn", s:fg, s:bg, s:none)
call HgS("Folded", s:fg, s:bg, s:none)

" hi link FoldColumn Normal
" hi link SignColumn Normal


hi link markdownH1                Title
hi link markdownCodeBlock         xv3_CodeBlock
hi link markdownCode              xv3_Code
hi link markdownHeadingDelimiter  xv3_Faded
hi link markdownRule              xv3_Faded
hi link markdownBlockquote        String
" disable em and strong to prevent unintended styling
hi link markdownEmphasis          Normal
hi link markdownStrong            Normal
hi link markdownBold          Normal
hi link markdownItalic            Normal
hi link markdownLongLine          xv3_WarnFg
hi link markdownError             xv3_Warn

set fillchars=eob:\ ,vert:\  " Note: space
