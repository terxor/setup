call plug#begin("$HOME/vimfiles/plugged")
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
call plug#end()

" Airline theme
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='ayu_dark'

" Markdown Preview
nmap <C-p> <Plug>(MarkdownPreview)

" Vim easy align
nmap ga <Plug>(EasyAlign)

" Papercolor theme
colorscheme PaperColor

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" Specific to windows
let NERDTreeIgnore=['\c^ntuser\..*']

