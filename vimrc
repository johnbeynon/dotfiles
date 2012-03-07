" Load pathogen and help tags
call pathogen#infect()
call pathogen#helptags()

" We're running Vim, not Vi!
set nocompatible

" Enable syntax highlighting
syntax on

" Set the color scheme
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

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
set tabstop=1
set shiftwidth=4
set softtabstop=4
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

" Minibuf Explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1

" powerline
let g:Powerline_symbols = 'fancy'

map <leader>gR :call ShowRoutes()<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>gg :topleft 10 :split Gemfile<cr>
map <leader>gr :topleft 10 :split config/routes.rb<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>t :CommandT<cr>
" let g:CommandTCancelMap='<Esc>'

" Let uppercase W write the file
command! W :w

" Disable the cursor keys - you'll thank me later!
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Autocommands
" autocmd! bufwritepost .vimrc so % " automatically SOURCE vimrc when it's saved
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running tests (FROM https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

"#map <leader>t :call RunTestFile()<cr>
"#map <leader>T :call RunNearestTest()<cr>
"#map <leader>a :call RunTests('')<cr>
"#map <leader>c :w\|:!script/features<cr>
"#map <leader>w :w\|:!script/features --profile wip<cr>

