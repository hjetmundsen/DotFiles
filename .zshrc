# LS Colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export TERM=xterm-256color

# Prompt
PS1="%2~ > "

# Case insensitive auto-complete
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
fpath=($fpath)

# Aliases
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
alias condaup='conda update --all'
alias sysup='brewup; condaup'
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

