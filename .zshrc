# LS Colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Prompt
PS1="%2~ > "

# Case insensitive auto-complete
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Aliases
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias condaup='conda update --all'
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias vim='nvim'
