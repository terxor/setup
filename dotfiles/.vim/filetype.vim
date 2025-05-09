" Filetype specific settings

augroup markdownSetup
  autocmd FileType markdown syn match markdownBlockquote '^\s*>.*'
  autocmd FileType markdown syn match markdownLongLine /\%81v.*$/
  autocmd FileType markdown setlocal textwidth=80
  autocmd FileType markdown setlocal formatoptions+=t
  autocmd FileType markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType markdown iabbrev ``` ```<CR>```<Up>
augroup END
