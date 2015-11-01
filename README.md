My .vimrc
=========
This is my .vimrc file, which contains my configuration and plugins for vim.

Dependencies
------------

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
using Consolas for poserline FixedD (sorry, don't remember where I got it...
I'll update this with a link ASAP), so if you don't have it installed you should
comment that line.

I am also using a custom theme for airline, so you will probably have to comment
out that line too (not sure if it breaks or not). Maybe I will fork airline and
add my theme so vundle can handle it directly or will submit the theme to the
official repo, but currently I think it's not that important.

NOTE FOR WINDOWS USERS
----------------------
If you use vim or gvim on Windows, you will probably have to rename this file
to \_vimrc for it to work.
