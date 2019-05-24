" for pathogen
call pathogen#infect()

" Turn on syntax highlighting
syntax enable
filetype plugin indent on
set cursorcolumn
set cursorline

" Show line numbers
set number

" Encoding
set encoding=utf-8

" Whitespace
set backspace=indent,eol,start
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab

" == vim-airline ===
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='papercolor'
" let g:Powerline_symbols = "fancy"
" set guifont=DejaVu_Sans_Mono_for_Powerline:h10

" === CtrlP ===
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" === RSpec ===
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" === EasyMotion ===
" Disable default mappings
let g:EasyMotion_do_mapping = 0 
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-overwin-f2)

" Line motions
" map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-lineanywhere)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" NERD Commenter
" Add spaces after comment delimiters by defaultAdd spaces after comment
" delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" vim-javascript
" let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" ALE
" let g:ale_fixers = {}
" let g:ale_fixers['javascript'] = ['prettier']
