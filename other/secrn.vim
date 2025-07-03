let g:allow_write = 0

function! s:GetBufferMd5()
  let content = join(getbufline('%', 1, '$'), "\n")
  let md5 = system('md5sum', content)
  return matchstr(md5, '^\x\+')
endfunction

command! Md5Sum echo 'MD5: ' . s:GetBufferMd5()

" Save with timestamp and last 6 characters of MD5
function! SaveWithMd5Suffix()
  let md5 = s:GetBufferMd5()
  let suffix = strpart(md5, strlen(md5) - 6)
  let timestamp = strftime("%Y%m%d%H%M%S")
  execute ':w ' . timestamp . '_' . suffix
endfunction

function! Encrypt()
  execute ':%!gpg --symmetric --cipher-algo AES256 | base64'
  let g:allow_write = 1
    try
      call SaveWithMd5Suffix()
    finally
        let g:allow_write = 0
    endtry
endfunction

command! Md5Sum echo 'MD5: ' . s:GetBufferMd5()
command! Decrypt execute ':%!base64 -d | gpg --decrypt 2>/dev/null'
command! Encrypt :call Encrypt()

function! PreventWrite()
  if !exists('g:allow_write') || !g:allow_write
    throw "WriteDisabledError"
  endif
endfunction

autocmd BufWritePre * call PreventWrite()

