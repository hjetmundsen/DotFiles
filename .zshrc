# LS Colors
export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LSCOLORS=ExFxBxDxCxegedabagacad

# Prompt
PS1="[jet] %2~ > "

# Case insensitive auto-complete
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Aliases
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias v='nvim'
alias clang++='clang++ -std=c++11'

# Z
source "$(brew --prefix)/etc/profile.d/z.sh"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
