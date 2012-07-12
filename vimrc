" Load pathogen and help tags
call pathogen#infect()
call pathogen#helptags()

" We're running Vim, not Vi!
set nocompatible

" Enable syntax highlighting
syntax on

" Set the color scheme
set background=dark
colorscheme molokai

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable filetype-specific indenting and plugins
filetype plugin indent on

" highligh the current line
set cursorline
set number

" minimal number of columns to use for the line number
set numberwidth=5

" enable unsaved buffers
set hidden

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smarttab
set incsearch " make search work like FIND in browsers
set hlsearch " highlight search terms
set autoread " reload file if it's changed outside VIM
set nowrap

" Always show the status line
set laststatus=2

" Remap leader to comma
let mapleader=","

" Map ; to : so one keypress less
nnoremap ; :

nnoremap <leader>w <C-w>v<C-w>l " ,w split verically and switch to new split

function! ShowRoutes() " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction

" powerline
let g:Powerline_symbols = 'fancy'

map <leader>gR :call ShowRoutes()<cr>

" Map CtrlP to Command-T - weird huh?
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>m :CtrlPMRUFiles<cr>


map <leader>gg :topleft 10 :split Gemfile<cr>
map <leader>gr :topleft 10 :split config/routes.rb<cr>

" Redo
map U <C-r>

" Map NERDTreeToggle to convenient key
nmap <leader>n :NERDTreeToggle<cr>

" Let uppercase W write the file
command! W :w

" Disable the cursor keys - you'll thank me later!
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
nnoremap j gj
nnoremap k gk

" CtrlP OS-X Menu remapping
if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

"use Ctrl+L to toggle the line number counting method
function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc

nnoremap <C-L> :call g:ToggleNuMode()<cr>
