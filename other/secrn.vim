let g:allow_write = 0

function! Encrypt()
  execute ':%!gpg --symmetric --cipher-algo AES256 | base64'
  let g:allow_write = 1
    try
        execute ':w ' . strftime("%Y%m%d%H%M%S")
    finally
        let g:allow_write = 0
    endtry
endfunction

command! Decrypt execute ':%!base64 -d | gpg --decrypt 2>/dev/null'
command! Encrypt :call Encrypt()

function! PreventWrite()
  if !exists('g:allow_write') || !g:allow_write
    throw "WriteDisabledError"
  endif
endfunction

autocmd BufWritePre * call PreventWrite()

