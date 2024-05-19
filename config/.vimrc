syntax on                         " syntax highlighting
set nocompatible                  " compatible with vi? no
set background=light              " affects colors
set termguicolors                 " better colors in terminal?
set hidden                        " allow modified unsaved buffers and other stuff
set encoding=utf-8                " just use it
set scroll=10                     " number of lines to scroll with <C-U>, <C-D>
set scrolloff=3                   " show more lines near ends while scrolling
set relativenumber                " relative line numbers
set incsearch                     " search as you type
set ignorecase                    " ignore case
set smartcase                     " case sensitive search when you enter mixed case
set hlsearch                      " highlight the matching patterns
set ruler                         " show line num, col in status bar
set wildmenu                      " shows options on tab while executing commands
set wildmode=longest:full,full    " show more options?
set nowrap                        " do not wrap lines
set tabstop=2                     " tab is 2 spaces
set shiftwidth=2                  " indents are two spaces
set expandtab                     " use spaces instead of tab char
set gdefault                      " substitute flag ':s///g' by default
set timeout                       " timeout on mapped key sequences
set timeoutlen=300                " how long to wait, find the right balance
set showmode                      " shows whether in insert/visual/replace mode
set showcmd                       " show partial commands below status line
set autoread                      " auto-reload modified buffers
set updatecount=0                 " disable swap files
set belloff=all                   " turn off terminal bell
set splitright                    " put the new window right of the current one 
set splitbelow                    " put the new window below the current one 

" -- MAPPINGS --
let mapleader = " "
inoremap kj <esc>
vnoremap kj <esc>

map ; $

" format paragraph
map Q gqip

vnoremap . :norm.<CR>

command! Cfg :normal <C-w><C-v><C-l>:e $MYVIMRC<cr>
" nnoremap <leader>rc 

" paste: in visual mode, paste replaces the selected content
nnoremap <leader>p "+p
vnoremap <leader>p d"+P

" copy: in visual mode, copy the selected content
" otherwise, complete the motion
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Reload vimrc
nnoremap <leader>\ :so $MYVIMRC<CR>

" Saving files and quitting
nnoremap <leader>q :q<CR>
" nnoremap <leader>d :bd!<CR>
nnoremap <leader>w :w<CR>

" Makes switching windows easier
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" put tab to good use
nnoremap <tab> %
vnoremap <tab> %

" clear search by searching for empty string
nnoremap <leader>/ :let @/=''<CR>

" Hide other windows
nnoremap <leader>o :only<CR>

" Change case of word
nnoremap <leader>a viw~

" Remove all whitespaces at line ends
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>d :put =strftime('%Y-%m-%d %H:%M:%S')<CR>
nnoremap <leader>in :%!python3 -m json.tool --indent 2<CR>
nnoremap <leader>il :%!python3 -m json.tool --indent 2 --json-lines<CR>

" -- STATUS LINE --

if has("statusline") && !&cp
  set laststatus=2                              " always show the status bar
  set statusline=\ %l/%L\ [col=%v]             " line and column
  set statusline+=\ %{&modified?'MODIFIED':''}   " show modified indicator
  set statusline+=%=                            " left-right separation point
  set statusline+=\ %{expand('%:p')}            " full file path
  set statusline+=\ %r                          " readonly indicator
endif

