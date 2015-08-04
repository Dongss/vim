"VIMIDE vimrc basic settings
"--------start---------
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileformat=unix
set guifont=Courier:h12
set linespace=4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set noswapfile
set backspace=start,indent,eol
set numberwidth=4
set autoindent
set smartindent
set nobackup
set writebackup
set hlsearch 
set incsearch
set autoread
set nu
set go=
set ruler
set bg=dark

filetype plugin on
filetype indent on
syntax on
:highlight PreProc guifg=green ctermfg=green

call pathogen#runtime_append_all_bundles()

noremap <F2> :w<cr>
inoremap <F2> <Esc>:w<cr>a
noremap <F12> :q!<cr>

" map <C-t> :CommandT<cr>
" map <C-b> :CommandTBuffer<cr>
" map <C-r> :CommandTFlush<cr>
" imap <C-t> <esc> <cr>
" set wildignore+=.git,.svn,*.o,*.ob­j,tmp,*swp,*.log
" let g:CommandTMaxFiles = 5000

map <C-t> :NERDTreeToggle<cr>
imap <C-t> <esc>:NERDTreeToggle<cr>
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="right"

map <C-j> <C-W>j 
map <C-k> <C-W>k 
map <C-h> <C-W>h 
map <C-l> <C-W>l 

if has("gui_running")
    colorscheme desert 
endif

au! BufRead,BufNewFile *.js set syntax=jquery
au! BufRead,BufNewFile *.less set syntax=css
au! BufRead,BufNewFile *.tpl set syntax=html
au! BufRead,BufNewFile *.sah set syntax=javascript

au! BufRead,BufNewFile *.js set filetype=javascript
au! BufRead,BufNewFile *.less set filetype=css
au! BufRead,BufNewFile *.tpl set filetype=html
au! BufNewFile,BufRead *.t2t set ft=txt2tags
"au! BufRead,BufNewFile *.proto set filetype proto
au! BufRead,BufNewFile *.sah set filetype=javascript

autocmd! bufwritepost .vimrc source ~/.vimrc

"--------vim-javascript---------
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

map <S-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" for php-doc
source ~/.vim/bundle/php-doc/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

" Default values
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = "$id$"
let g:pdv_cfg_Author = "chenyou <chenyou@ucloud.cn>"
let g:pdv_cfg_Copyright = "2013 The UCLOUD Group"
let g:pdv_cfg_License = "PHP Version 3.0 {@link http://www.php.net/license/3_0.txt}"

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
set tags=~/tags

map <C-b> :% ! php_beautifier --filters "phpBB() EqualsAlign() ArrayNested()"<CR>
