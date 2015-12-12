My .vimrc
=========
This is my .vimrc file, which contains my configuration and plugins for vim.

Setting it up
--------------

###Vundle
This file depends on [Vundle](https://github.com/VundleVim/Vundle.vim) to manage
plugins. This allows me to keep my plugin dependencies on this file, not having
to keep my full .vim folder under version control. If you plan to use this file,
you will have to install it before (good luck if you are on Windows :) ).

#####NOTE
You will need to run `:PluginInstall` for the plugins to be installed by Vundle.

###Airline patched fonts
Since I use [Airline Plugin](https://github.com/bling/vim-airline), I have to
use a patched font in order to see the symbols of this plugin. I am currently
using [Consolas for powerline FixedD](https://github.com/eugeii/consolas-powerline-vim),
so if you don't have it installed you should comment that line.

###Airline custom theme
I use a custom theme I made for Airline. If you want to use it, you must copy
`monowarm.vim` into `~/.vim/vim-airline/autoload/airline/themes`
(`~/vimfiles/vim-airline/autoload/airline/themes` if you are on Windows).

Otherwise, you must use a built in theme (I have already chosen one in .vimrc).

NOTE FOR WINDOWS USERS
----------------------
If you use vim or gvim on Windows, you will probably have to rename this file
to \_vimrc for it to work.
