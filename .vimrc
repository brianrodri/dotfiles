" Plugs --------------------------- {{{
" OS Specific Settings ----------- {{{
if has("win32") || has("win16")
  if empty(glob('~/vimfiles/autoload/plug.vim'))
    silent !curl -fLo ~/vimfiles/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
  call plug#begin("~/vimfiles/winplugged")
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
  call plug#begin("~/.vim/plugged")
endif
" }}}

Plug 'benjaminwhite/Benokai'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mrtazz/molokai.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'suan/vim-instant-markdown'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

call plug#end()
"}}}
" Plugs' Settings ----------------- {{{
" vim-malokai -------------------- {{{
:set background=light
:syntax enable
:colorscheme molokai
:set t_Co=256
let g:molokai_original = 1
hi Normal ctermbg=none
hi NonText ctermbg=none
" }}}
" vim-instant-markdown ----------- {{{
:let g:vim_markdown_folding_disabled = 1
:let g:instant_markdown_slow = 1
:let g:instant_markdown_autostart = 0
:filetype plugin on
" }}}
" ctrlp -------------------------- {{{
:let g:ctrlp_extensions = ['tag']
:let g:ctrlp_use_caching = 0
" }}}
" vim-cpp-enhanced-highlight ----- {{{
:let g:cpp_class_scope_highlight = 1
:let g:cpp_experimental_template_highlight = 1
" }}}
" easytags ----------------------- {{{
:set tags=./tags;
:let g:easytags_dynamic_files = 1
:let g:easytags_include_members = 1
:let g:easytags_events = ['bufwritepost']
" }}}
" tagbar ------------------------- {{{
nmap <F8> :TagbarToggle<CR>
" }}}
" vim-airline -------------------- {{{
:let g:airline_theme='powerlineish'
:let g:airline_left_sep=''
:let g:airline_right_sep=''
:let g:airline_section_z=''
" }}}
" vim-expand-region -------------- {{{
let g:expand_region_text_objects = {
    \ 'iw'  :0,
    \ 'aw'  :0,
    \ 'i''' :0,
    \ 'i"'  :0,
    \ 'i]'  :1,
    \ 'ib'  :1,
    \ 'iB'  :1,
    \ 'il'  :0,
    \ 'ip'  :0,
    \ 'ie'  :0,
    \}
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}
" }}}
" Basic Settings ------------------ {{{
:set linebreak
:set backspace=indent,eol,start
:set winminheight=0
:set nohlsearch
:set incsearch
:set number
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set cindent
:set ruler
:set tags=./tags
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set matchpairs+=<:>
" }}}
" File-Specific Settings ---------- {{{
" Markdown file settings --------- {{{
augroup filetype_md
autocmd!
autocmd FileType markdown :setlocal spell
autocmd FileType markdown :onoremap <buffer> ih :<c-u>execute "normal! ?^\\-\\-\\+$\r:nohlsearch\rkvg_"<cr>
autocmd FileType markdown :onoremap <buffer> ah :<c-u>execute "normal! ?^\\-\\-\\+$\r:nohlsearch\rg_vk0"<cr>
autocmd FileType markdown :onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
autocmd FileType markdown :onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}
" Vimscript file settings -------- {{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}
" Python file settings ----------- {{{
augroup filetype_py
autocmd!
autocmd FileType python :nnoremap J Ji <esc>
autocmd FileType python :nnoremap I miggo
augroup END
" }}}
" }}}
" Mappings ------------------------ {{{
" Hard Mappings ------------------ {{{
nnoremap - ddp
nnoremap _ ddkP
nnoremap / /\v
nnoremap ? ?\v
inoremap <c-u> <Esc>bvwUea
nnoremap <c-u> viwU
nnoremap H ^
nnoremap L $
inoremap jk <Esc>
vnoremap jk <Esc>
inoremap <Esc> <nop>
vnoremap <Esc> <nop>
nnoremap ch :nohlsearch<cr>
nnoremap gg mqgg
nnoremap G mrG
" }}}
" Leader Mappings ---------------- {{{
let mapleader = "\<Space>"
let localleader = ","
xnoremap       <leader>a          :!~/Dropbox/projects/python/argalign.py -r 1
xnoremap       <leader>w          :!python -c 'import textwrap, sys; print(textwrap.fill("".join(sys.stdin.read().splitlines()), 80));'<CR><CR>
xnoremap       <leader>s          :!sort<cr>
nnoremap       <leader>e          80\|
nnoremap       <leader>m          :make<CR>
vnoremap       <leader>q          :q!<CR>
nnoremap       <leader>q          :q!<CR>
nnoremap       <leader>x          :q
vnoremap       <leader>x          :q
nnoremap       <leader>j          o<Esc>k
nnoremap       <leader>k          O<Esc>j
nnoremap       <leader>o          :CtrlP<cr>
nnoremap       <leader>w          :w<cr>
vnoremap       <leader>y          "*y
vnoremap       <leader>d          "*d
nnoremap       <leader>p          "*p
nnoremap       <leader>p          "*p
vnoremap       <leader>p          "*p
vnoremap       <leader>p          "*p
nnoremap       <leader>ev         :split $MYVIMRC<CR>
nnoremap       <leader>sv         :source $MYVIMRC<CR>
nnoremap       <leader>osa        :execute "leftabove vsplit " . bufname("#")
nnoremap       <leader>osb        :execute "rightbelow vsplit " . bufname("#")
nnoremap       <leader>osl        :execute "leftabove split " . bufname("#")
nnoremap       <leader>osr        :execute "rightbelow vsplit " . bufname("#")
" }}}
" }}}
" Abbreviations ------------------- {{{
iabbrev @@ thatbrod@gmail.com 
" }}}
" Custom Movements ---------------- {{{
onoremap ni( :<c-u>normal! f(vi(<cr>
onoremap pi( :<c-u>normal! F)vi(<cr>
onoremap na( :<c-u>normal! f(va(<cr>
onoremap pa( :<c-u>normal! F)va(<cr>

onoremap ni{ :<c-u>normal! f{vi{<cr>
onoremap pi{ :<c-u>normal! F}vi{<cr>
onoremap na{ :<c-u>normal! f{va{<cr>
onoremap pa{ :<c-u>normal! F}va{<cr>

onoremap pi@ :<c-u>execute "normal! ?\\<\\w*@\\w*\\.\\w*\\>\r:nohlsearch\rv//e\r"<cr>
onoremap ni@ :<c-u>execute "normal! /\\<\\w*@\\w*\\.\\w*\\>\r:nohlsearch\rv//e\r"<cr>
" }}}
" Custom Functionality ------------ {{{
" Don't Clobber Paste Register --- {{{
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
" }}}
" Window Navigation -------------- {{{
nnoremap <silent><A-Up>    :wincmd k<CR>
nnoremap <silent><A-Down>  :wincmd j<CR>
nnoremap <silent><A-Left>  :wincmd h<CR>
nnoremap <silent><A-Right> :wincmd l<CR>
" }}}
" }}}
