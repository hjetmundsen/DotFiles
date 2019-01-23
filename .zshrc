# Editor
export EDITOR=nvim

# Prompt
PS1="[jet %2~]$ "

# Case insensitive auto-complete
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Aliases
alias v='nvim'
alias clang++='clang++ -std=c++11'
alias g++='g++ -std=c++11'
alias ls='ls --color=auto'
alias c='clear'
