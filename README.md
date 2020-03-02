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
- Leader-pf will fuzzy file search the current working directory
- Leader-pg will fuzzy file search a project with .git in the root folder
- Leader-pb will fuzzy search open buffers
- Leader-pr will run ripgrep on the current file
- Leader-bb will list buffers
- Leader-bn will go to next buffer
- Leader-bp will go to previous buffer

- Ctrl-jk will move up and down in the buffer and file search menus

Important tmux changes
-----------------------
- Mapped prefix to tilde
- prefix-hjkl will move between panes
