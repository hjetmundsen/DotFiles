# LS Colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Prompt
PS1="%2~ > "

# Case insensitive auto-complete
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
fpath=($fpath)

# Aliases
alias python='python3'
alias brewup='brew update && brew upgrade && brew cleanup &&  brew prune && brew doctor'

# Rbenv initialize
eval "$(rbenv init -)"

# n initialize
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
