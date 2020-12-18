#!/usr/bin/env bash

function needsInstall() {
  local cmdToCheck="$1"
  if command -v "$cmdToCheck" >/dev/null; then
    return 0
  fi
  return 1
}

# Install homebrew
if needsInstall "brew"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install SDKman
if needsInstall "sdk"; then
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Install vim plugin manager
if [ ! -f "~/.vim/autoload/plug.vim" ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install tmux plugin manager
if [ ! -d "~/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install Rust
if needsInstall "rust"; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Install some Rust tools
rustup component add clippy
rustup component add rustmft

# Install some Go tools
if needsInstall "godoc"; then
  go get golang.org/x/tools/cmd/godoc
fi
if needsInstall "golint"; then
  go get github.com/golang/lint/golint
fi
