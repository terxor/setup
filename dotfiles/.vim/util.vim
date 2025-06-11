" Utility commands and other settings

command! Config :e $MYVIMRC
command! TrimWhitespace :normal :%s/\s\+$// | :let @/=''
command! JsonIndent execute ':%!python3 -m json.tool --indent 2'
command! JsonLinesIndent execute ':%!python3 -m json.tool --indent 2 --json-lines'
command! CopyFileName :let @+ = expand('%:t') | echo 'Copied: ' . @+
command! CopyFilePath :let @+ = expand('%:p') | echo 'Copied: ' . @+
command! Reformat :%!clang-format
command! Timestamp :put =strftime('%Y-%m-%d %H:%M:%S')

" autocmd OptionSet diff setlocal syntax=off
if &diff
syntax off
set nocursorline
endif

" settings for fzf-vim plugin
let g:fzf_vim = {}
let g:fzf_vim.preview_window = []

command! -bang -nargs=* Rg call fzf#vim#grep("rg --hidden --no-ignore --glob '!.git/*' --column --line-number --no-heading --color=always --smart-case " .
            \ <q-args>, 1, <bang>0)


function! RunCmdOnPara(cmd)
  " Save current unnamed register
  let save_reg = getreg('"')
  let save_regtype = getregtype('"')

  normal! dip

  " Get deleted text from unnamed register
  let lines = getreg('"', 1, 1)

  " Run shell command with deleted paragraph as input
  let result = systemlist(a:cmd, lines)

  " Insert result below current line
  call append(line('.') - 1, result)

  " Restore unnamed register
  call setreg('"', save_reg, save_regtype)
endfunction

function! RunTextQuery(...) abort

  " Determine query
  if a:0 > 0
    " Use passed query
    let query = a:1
    echom 'query is(from arg): ' . query
  else
    " Auto-extract query from next ``` block
    let start = -1
    let end = -1
    let total_lines = line('$')

    for lnum in range(line('.') + 1, total_lines)
      let line_content = getline(lnum)
      if line_content =~ '^```'
        if start == -1
          let start = lnum + 1
        else
          let end = lnum - 1
          break
        endif
      endif
    endfor

    if start == -1 || end == -1 || start > end
      echoerr "Could not find a valid ``` query block below the table."
      return
    endif

    let query_lines = getline(start, end)
    let query = join(query_lines, " ")
    echom 'query is: ' . query
  endif

  " Save current unnamed register
  let save_reg = getreg('"')
  let save_regtype = getregtype('"')
  normal! yip

  " Get deleted text from unnamed register
  let lines = getreg('"', 1, 1)

  " Restore unnamed register
  call setreg('"', save_reg, save_regtype)

  let normalized = systemlist('dfx --from md --to csv', lines)

  " Construct the shell command with the input
  let cmd = 'textquery "' . query . '"'

  " Run shell command with deleted paragraph as input
  let result = systemlist(cmd, normalized)

  redraw!
  " Show output line-by-line
  " for line in result
  for line in result
    echom line
  endfor

  " Prompt user for action
  echon "\nPress <Enter> to copy to clipboard, any other key to cancel"

  " Wait for input key
  let key = getchar()

  if key ==# char2nr("\r") 
    " Copy to system clipboard
    call setreg('+', join(result, "\n"))
    echom "Output copied to clipboard."
  else
    echom "Output discarded."
  endif

endfunction

command! Csv2Md call RunCmdOnPara('dfx --from csv --to md')
command! MdTableFixup call RunCmdOnPara('dfx --from md --to md')
command! -nargs=? TextQuery call RunTextQuery(<f-args>)


