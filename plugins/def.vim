" Start plugins definition
call plug#begin($HOME.'/.vim/plugins/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'goatslacker/mango.vim'
Plug 'bling/vim-airline', { 'do' : $HOME.'/.vim/fonts/install' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/syntastic'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'maksimr/vim-jsbeautify', { 'do' : 'git submodule update --init --recursive' }
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'marijnh/tern_for_vim', { 'do' : 'npm install' }
Plug 'moll/vim-node'
Plug 'syngan/vim-vimlint'
Plug 'ynkdir/vim-vimlparser'
Plug 'wesQ3/vim-windowswap'
Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'
Plug 'Townk/vim-autoclose'
Plug 'kien/ctrlp.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'nanotech/jellybeans.vim'

call plug#end()
