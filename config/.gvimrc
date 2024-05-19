" Make GVIM minimal
set guifont=Inconsolata:h12

set guioptions+=c
set guioptions-=m
" No GUI toolbar
set guioptions-=T

" No left-hand scrollbar
set guioptions-=l
set guioptions-=L

" No right-hand scrollbar
set guioptions-=R
set guioptions-=r

" Non GUI tabline
set guioptions-=e

set guicursor=n-v-c:block-Cursor
set guicursor+=i:block-iCursor

set guicursor+=a:blinkon0

highlight Cursor guifg=black guibg=#b5b5b5
highlight iCursor guifg=black guibg=#80ff30
