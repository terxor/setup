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

