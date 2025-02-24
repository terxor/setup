# VIM usage guidelines

Normal to edit without text manipulation
- `i` : at cursor
- `a` : after cursor
- `A` : after last char in line
- `I` : first char in line

Normal to edit with text manipulation
- `c[motion]` : remove text and edit
- `C`: remove current pos to end of line, and edit
- `S/cc`: remove whole line, and edit (keep indents)
- `s`: remove current character and edit at same place
- `o`: add newline after current line and insert mode (keep indent)
- `O`: add newline before current line and insert mode (keep indent)

motions:
- `h,l`: Single char motion
- `j,k`: Single line motion
- `0,;`: Start, end of line (; is custom mapped from $)
- `f,t`: Go to/before next instance of character
- `w`: Go to next word (start) 
- `b`: Go to start of current word, or previous word if already at start
- `e`: Go to end of current word, or end of next word if already at end
- `W,B,E` : same as `w,b,e` but considers whitespace as delimiter
- G: last line

edits:
- x : delete char under cursor
- X : delete char before cursor
- `~[motion]` (use with tildeop)

Note: `_` is considered as part of word,y but other spe\"ial characters are not


bindings in INSERT mode:
- <C-T>, <C-D> insert/delete indent in current line
- <C-w> delete previous word (or till start of current word)
- <C-y> insert char above the cursor (prev line)
- Too much optimization? <C-o> execute one command and return to 
  insert mode.

A sentence is defined as ending at a '.', '!' or '?' followed by either the
end of a line, or by a space or tab.  Any number of closing ')', ']', '"'
and ''' characters may appear after the '.', '!' or '?' before the spaces,
tabs or end of line.  A paragraph and section boundary is also a sentence
boundary.

--------------------------------

## Misc example cases

How to delete all lines not containing a word `abc`
```
:g!/abc/d
```









