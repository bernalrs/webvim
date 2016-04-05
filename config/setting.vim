"
" WebVim Configuration : global settings
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
" source: https://github.com/krampstudio/dotvim
" year  : 2015
"

" wrap end of line
set wrap

" show line numbers
set number

" syntax highlighting
syntax on
"set background=dark
set t_Co=256

"indent
set smartindent
set autoindent
set copyindent
set shiftwidth=4
set shiftround
set backspace=indent,eol,start
set smarttab
set expandtab

"search
set showmatch
set smartcase

set hlsearch
set incsearch

" folding manual
set foldmethod=manual

" mouse
set mouse=a

" spell check, to be activated manually
set spelllang=en_us
set nospell

set cursorline
set ignorecase

" Two tabs only for sass files
autocmd Filetype scss setlocal ts=2 sts=2 sw=2

" sqli files are sql files
au BufReadPost *.sqli set syntax=pgsql

" Use postgres syntax for all sql files
let g:sql_type_default = 'pgsql'

" Vim grep opens result in a quick fix window
command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen 33

