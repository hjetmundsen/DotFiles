# DotFiles
A repo to store any important dotfiles

To get vimrc working you need to install Vim Plug. The instructions to install can be found at the offical repository.

https://github.com/junegunn/vim-plug

After Installation run "nvim +PlugInstall +qall" to install dependencies

Some packages may not work properly if you aren't using Neovim.
https://neovim.io/

You MUST be using a terminal with true color support for my color settings
to display properly

----------------------------------------

Important vimrc changes
-----------------------
- Mapped Leader to Spacebar
- Leader-t will open Tagbar
- Leader-hjkl will move between open windows
- Leader-c-Leader will comment and uncomment lines
- Ctrl-hjkl will move between tabs
- Semicolon and Colon are swapped in normal mode
- Leader-f moves forward a page
- Leader-b moves back a page
- Leader-d moves down half a page
- Leader-u moves up half a page
- Leader-x swaps the current window with the window on the right
- Leader-pf will fuzzy file search the current working directory
- Leader-pg will fuzzy file search a project with .git in the root folder
- Leader-pb will fuzzy search open buffers
- Leader-pr will run ripgrep on the current file

Important tmux changes
-----------------------
- Mapped prefix to tilde
- prefix-hjkl will move between panes
