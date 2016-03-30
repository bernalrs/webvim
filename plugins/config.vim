"
" WebVim Configuration : Plugins configuration
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
" source: https://github.com/krampstudio/dotvim
" year  : 2015
"

" TODO split by plugin ?


" [> NERDTree <]

" on vim enter opens nerd tree
function! OpenNerdTree()
    let s:exclude = ['COMMIT_EDITMSG', 'MERGE_MSG']
    if index(s:exclude, expand('%:t')) < 0
        NERDTreeFind
        exec "normal! \<c-w>\<c-w>"
    endif
endfunction
"autocmd VimEnter * call OpenNerdTree()

" nerdtree autoclose if it is the last opened buffer
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" nerdtree window resize
let g:NERDTreeWinSize = 35

" show hidden files
let g:NERDTreeShowHidden=1

" single click to open nodes
" let g:NERDTreeMouseMode=3

" ignored files
let g:NERDTreeIgnore=['\.swp$', '\~$', '\.pyc$']
nnoremap <c-n> :NERDTreeToggle<cr>


" [> NERDCommenter <]

noremap <c-_> :call NERDComment(0, "Toggle")<cr>


" [> Airline <]

" status line always opened
set laststatus=2

let g:airline#extensions#tabline#enabled = 1

"  powerline font
let g:airline_powerline_fonts=0

" show the buffer numbers
let g:airline#extensions#tabline#buffer_nr_show = 1


" [> EditorConfig <]

" to avoid issues with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


" [> Syntastic <]

"" Syntax checkers

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_html_checkers=['tidy']
let g:syntastic_html_args = "--show-body-only yes"
"let g:syntastic_html_checkers=['w3']
"let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_vim_checkers=['vimlint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_yaml_checkers=['js-yaml']
let g:syntastic_scss_checkers=['scss-lint']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_handlebars_checkers=['handlebars']
let g:syntastic_tpl_checkers=['handlebars']

" get available js linters
function! GetJslinters()
    let l:linters = [ ['eslint', '.eslintrc'], ['jshint', '.jshintrc'] ]
    let l:available = []
    for l:linter in l:linters
       if executable(l:linter[0])
            call add(l:available, l:linter)
       endif
    endfor
    return l:available
endfunction

" check if the path to see if a linter config is present
function! Jslinter(path, linters)
    let l:dir = fnamemodify(a:path, ':p:h')

    if(l:dir == '/')
        return ''
    endif

    for l:linter in a:linters
        if filereadable(l:dir . '/' . l:linter[1])
            return l:linter[0]
        endif
    endfor

    return Jslinter(fnamemodify(l:dir, ':h'), a:linters)
endfunction

" set the jslinter into Syntastic
function! SyntasticSetJsLinter()

    let l:availableLinters = GetJslinters()

    " look for linter config in the current folder
    let l:jslinter = Jslinter(expand('%:p'), l:availableLinters)
    if l:jslinter == ''
        " otherwise look into the home dir
        let l:jslinter = Jslinter($HOME, l:availableLinters)
    endif

    " configure the linter
    if l:jslinter != ''
        let g:syntastic_javascript_checkers=[l:jslinter]
    endif
endfunction

call SyntasticSetJsLinter()

" [> EasyAlign <]

" select paragraph and start easyalign on the left
nnoremap <leader>a vip<Plug>(EasyAlign)<cr>

" Start interactive align to the right
vmap <leader>a <Plug>(EasyAlign)<cr><right>

let g:easy_align_ignore_groups = ['Comment']


" [> multiple cursor <]

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-S-d>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<esc>'


" [> JsBeautify <]

" format selection
autocmd FileType javascript vnoremap <buffer>  <C-S-F> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer>  <C-S-F> :call RangeJsonBeautify()<cr>
autocmd FileType html vnoremap <buffer> <C-S-F> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <C-S-F> :call RangeCSSBeautify()<cr>

" format the whole file
autocmd FileType javascript nnoremap <buffer>  <C-S-F> :call JsBeautify()<cr>
autocmd FileType json nnoremap <buffer>  <C-S-F> :call JsonBeautify()<cr>
autocmd FileType html nnoremap <buffer> <C-S-F> :call HtmlBeautify()<cr>
autocmd FileType css nnoremap <buffer> <C-S-F> :call CSSBeautify()<cr>

" [> YankStack <]

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste


" [> Javascript libraries syntax <]

let g:used_javascript_libs = 'jquery,underscore,requirejs,chai,handlebars'


" [> CtrlP <]

" Ignore files and folders
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|pdf|toc|log|out|aux)$',
  \ }
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard | grep -v  "flash\|3rd_party\|flex\|objectivec\|java\|system_tests\|csharp\|cpp"']
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard | grep -v  "flash\|3rd_party\|flex\|objectivec\|java\|system_tests\|csharp"']


" Theme
set background=dark
"colorscheme hybrid
colorscheme jellybeans
highlight ColorColumn ctermbg=8
set colorcolumn=100


" [> Ultisnips <]
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

" [> YouCompleteMe <]
"let g:ycm_key_list_select_completion = ['<TAB>', '<c-j>']
"let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-k>']
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']


" [> DBEXT <]
let g:dbext_default_profile_rbertrand_beta = 'type=PGSQL:user=beta_usr:passwd=beta:dbname=beta_db'

" [> image.vim <]
au BufRead *.png,*.jpg,*.jpeg,*.PNG :call DisplayImage()

