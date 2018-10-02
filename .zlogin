# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

# n initialize
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
