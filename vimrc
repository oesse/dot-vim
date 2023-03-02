" main vimrc file
"
" This file uses vim-plug and assumes a directory structure of:
"     .vim/
"       autoload/
"         plug.vim
"       bundle/
"         ... local ftplugins and settings ...
"       plugged/
"         ... directory for vim-plug plugins ...
"       spell/
"         ... local dictionaries ...
"       swap/
"         ... swap files ...
"       undo/
"         ... undo files ...
"       vimrc

" Plugins {{{1

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'junegunn/seoul256.vim'

" Defaults
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

" Linenumbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Distraction free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Vimscript
Plug 'junegunn/vader.vim'

" Align things
Plug 'junegunn/vim-easy-align'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'

" git
Plug 'tpope/vim-fugitive'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug '~/.vim/bundle/local-snippets'

" Search
Plug 'haya14busa/vim-asterisk'

" Local plugins
Plug '~/.vim/bundle/local-ftypes'

call plug#end()

" Theme {{{1

colorscheme seoul256

" Default Settings {{{1

set tabstop=4 shiftwidth=4 expandtab
set number relativenumber

set path=$PWD/**
set wildignore+=**/node_modules/**
set wildignore+=**/coverage/**
set wildignore+=**/*.class

set undofile
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//
set undodir=$HOME/.vim/undo//

set listchars=tab:➢\ ,eol:¬,trail:•
set list
set linebreak
set showbreak=…\ 

" Statusline
set laststatus=2  " always show the statusline
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=[%n]\                        " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%b,0x%-4B\ \                 " current char
set statusline+=%-10.(%l,%c%V%)\ %<%P        " offset

" Plugin Settings {{{1
" Netrw {{{2
let g:netrw_banner = 0

" Limelight {{{2
augroup Limelight
  au!
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" UltiSnips
let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/my-snippets/UltiSnips/'

" Mappings {{{1

nnoremap -q :quit<cr>
nnoremap -w :update<cr>
nnoremap -v :vsplit<cr>
nnoremap -h :split<cr>
nnoremap -d :Explore<cr>

nnoremap -s :source $MYVIMRC<cr>
nnoremap -e :split $MYVIMRC<cr>
nnoremap -E :execute "split "..fnamemodify("$MYVIMRC", ":p:h").."/bundle/local-ftypes/after/ftplugin/"..&ft..".vim"<cr>

cnoremap %% %:h/

" UltiSnips Mappings
nnoremap -ue :UltiSnipsEdit<cr>

" Asterisk Mappings
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)


" EOF {{{1
