" ==============================================================================
" File: .vimrc
" Author: Adrian Moreno
" Maintainer: Adrian Moreno (admoreno@outlook.com)
" Repository: https://github.com/Adriem/my-vimrc
" Version: 1.1
" ==============================================================================

set encoding=utf-8
" Windows E303 issue fix
if has("win32") || has("win16")
  set directory=.,$TEMP
endif

" {{{1                                                         Section: PLUGINS 
" ==============================================================================
set nocompatible  " be iMproved, required
filetype off      " required
" Required for Windows
if has("win32") || has("win16")
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  call vundle#begin('~/vimfiles')
" Required for linux
else
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'     " let Vundle manage Vundle, required
Plugin 'Raimondi/delimitMate'     " Auto-completion for quotes, parens, etc
Plugin 'Yggdroot/indentLine'      " Display indentation levels
Plugin 'Tabular'                  " Text auto-align
Plugin 'scrooloose/NERDTree'      " Tree file explorer
Plugin 'tpope/vim-fugitive'       " Git wrapper (needed for gitgutter & airline)
Plugin 'airblade/vim-gitgutter'   " Display a git diff in the gutter
Plugin 'bling/vim-airline'        " Enhanced status/tabline
Plugin 'scrooloose/NERDCommenter' " Toggle comments
Plugin 'jeetsukumaran/vim-indentwise' " Navigation through indentation levels

Plugin 'vim-coffee-script'   " Coffeescript syntax plugin
Plugin 'groenewege/vim-less' " Less syntax plugin

Plugin 'Adriem/vim-colorschemes' " Custom colorscheme

call vundle#end()          " required
filetype plugin indent on  " required

" {{{2                                              Sub-Section: AIRLINE PLUGIN
" ------------------------------------------------------------------------------
"let g:airline_theme='soft'    " This theme is a custom one I made
"let g:airline_theme='ubaryd'
"let g:airline_theme='hybrid'
"let g:airline_theme='zenburn'
let g:airline_theme='bubblegum'
set guifont=Consolas\ for\ Powerline\ FixedD:h10  " Fixed font for airline
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" {{{2                                          Sub-Section: INDENT LINE PLUGIN
" ------------------------------------------------------------------------------
"let g:indentLine_char='|'
let g:indentLine_color_term = 238
let g:indentLine_color_gui  = '#444444'

" {{{2                                         Sub-Section: DELIMIT MATE PLUGIN
" ------------------------------------------------------------------------------
set backspace=indent,eol,start
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
let delimitMate_expand_space = 1

" {{{2                                             Sub-Section: NERDTREE PLUGIN
" ------------------------------------------------------------------------------
let NERDTreeDirArrows = 1
let NERDTreeCascadeOpenSingleChildDir = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
"let NERDTreeShowBookmarks = 1


" {{{1                                                   Section: CUSTOMIZATION
" ==============================================================================
syntax on          " Enable syntax highlight
colorscheme adriem-autumn
let &colorcolumn=join(range(81,999),",") " Highlight columns beyond 80
" set guifont=Consolas:h10

set laststatus=2   " Always show status line
set ruler          " Show position of the cursor in status bar
set number         " Show number lines
set cursorline     " Highlight cursor line
set guioptions-=T  " Hide toolbar in graphic mode

set tabstop=4 shiftwidth=4 expandtab " Use spaces when tab is pressed
autocmd Filetype coffee setlocal ts=2 sw=2 expandtab

" {{{2                                        Sub-Section: COMMANDS AND ALIASES
" ------------------------------------------------------------------------------
com! W wa | Run  " This command needs a command Run to be defined. Since Run
                 " command may vary depending on the project, it is not defined
                 " by default
com! RmTrail :s/\s*$//g  " Remove extra whitespaces at the end of the lines


" {{{1                                                    Section: KEY MAPPINGS
" ==============================================================================
let mapleader=","
" Add ; at the end of the line with <leader>;
nmap <leader>; A;<ESC>
vmap <leader>; :s/$/;/g<CR>
" Indent w /TAB (CTRL + TAB on insert mode) and de-indent with SHIFT + TAB {{{2
nmap <Tab> >>
nmap <S-Tab> <<
imap <C-Tab> <C-t>
imap <S-Tab> <C-d>
vmap <Tab> >gv
vmap <S-Tab> <gv
" Save with CTRL + s on every mode {{{2
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>a
vmap <C-s> <ESC>:w<CR>gv
" Undo with CTRL + z on every mode {{{2
nmap <C-z> u
imap <C-z> <ESC>ui
vmap <C-z> <ESC>u
" Move lines up and down with ALT + SHIFT + h/j on every mode {{{2
nmap <M-S-k> :m-2<CR>
nmap <M-S-j> :m+1<CR>
imap <M-S-k> <ESC>:m-2<CR>gi
imap <M-S-j> <ESC>:m+1<CR>gi
"vmap <M-S-k> :m .-2<CR>gv
"vmap <M-S-j> :m .+1<CR>gv " FIXME Doesn't work for more than 1 line selected
" Toggle comment with ALT + c (depends on NERDCommenter) {{{2
nmap <M-c> <Plug>NERDCommenterToggle
imap <M-c> <ESC><Plug>NERDCommenterToggle<CR>
vmap <M-c> <Plug>NERDCommenterToggle gv
vmap <M-S-c>c <Plug>NERDCommenterToggle
vmap <M-S-c>i <Plug>NERDCommenterInvert

" FOLDING SHORTCUTS (most of them depend on indentwise plugin) {{{2
" ------------------------------------------------------------------------------
" Create a fold for the current indentation level
nmap <leader>z= [%V]%zf
" Create a fold for the next statement with more indentation
nmap <leader>z+ ]+V]%zf
" Create a fold for the next statement with less indentation, specially useful
" when on a split statement
nmap <leader>z- ]-V]%zf
" Create a fold for the next statement with more indentation, but ignoring
" following double indented lines (it assumes that double indented lines are
" the same statement split into two lines)
nmap <leader>z_ ]+]-V]%zf
" Toggle fold recursive with ,z<space>
nmap <leader>z<space> zA
vmap <leader>z<space> zA
" Toggle fold with ALT + f
nmap <M-f> za
imap <M-f> za
vmap <M-f> za
" Toggle fold the next fold (useful when on a function declaration)
nmap <M-S-f> zjzak


" Configure folding for this file {{{1
" vim: set foldmethod=marker :
" vim: set foldlevel=2 :
