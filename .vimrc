set encoding=utf-8
let mapleader=","
" Windows E303 issue fix
if has("win32") || has("win16")
  set directory=.,$TEMP
endif

" VUNDLE CONFIGURATION                                     VUNDLE CONFIGURATION
" ==============================================================================
set nocompatible  " be iMproved, required
filetype off      " required
if has("win32") || has("win16")
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  call vundle#begin('~/vimfiles')
else
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'     " let Vundle manage Vundle, required
Plugin 'scrooloose/NERDTree'      " Tree file explorer
Plugin 'scrooloose/NERDCommenter' " Commenting shortcuts
Plugin 'Raimondi/delimitMate'     " Auto-completion for quotes, parens, etc
Plugin 'Yggdroot/indentLine'      " Display indentation levels
Plugin 'vim-coffee-script'        " Coffeescript syntax plugin
Plugin 'groenewege/vim-less'      " Less syntax plugin
Plugin 'tpope/vim-fugitive'       " Git wrapper (needed for gitgutter & airline)
Plugin 'airblade/vim-gitgutter'   " Display a git diff in the gutter
Plugin 'bling/vim-airline'        " Enhanced status/tabline

call vundle#end()          " required
filetype plugin indent on  " required

" AIRLINE PLUGIN                                                 AIRLINE PLUGIN
" ==============================================================================
let g:airline_theme='soft'
set guifont=Consolas\ for\ Powerline\ FixedD:h10
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

" APPEARANCE                                                         APPEARANCE
" ==============================================================================
syntax on          " Enable syntax highlight
set laststatus=2   " Always show status line
set ruler          " Show position of the cursor in status bar
set number         " Show number lines
set cursorline     " Highlight cursor line
set guioptions-=T  " Hide toolbar in graphic mode
" set guifont=Consolas:h10
colorscheme nixium
let &colorcolumn=join(range(81,999),",")  " Highlight columns beyond 80

" INDENT SETTINGS                                               INDENT SETTINGS
" ==============================================================================
set tabstop=4 shiftwidth=4 expandtab " Use spaces when tab is pressed
autocmd Filetype coffee setlocal ts=2 sw=2 expandtab

" INDENT LINE PLUGIN                                         INDENT LINE PLUGIN
" ==============================================================================
"let g:indentLine_char='|'
"let g:indentLine_color_term=239
"let g:indentLine_color_gui='#09AA08'

" DELIMIT MATE PLUGIN                                       DELIMIT MATE PLUGIN
" ==============================================================================
set backspace=indent,eol,start
let delimitMate_expand_cr=1
let delimitMate_jump_expansion=1
let delimitMate_expand_space=1
