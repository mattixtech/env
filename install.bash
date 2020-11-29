#!/usr/bin/env bash

function needsInstall() {
  local cmdToCheck="$1"
  if command -v "$cmdToCheck" >/dev/null; then
    return 0
  fi
  return 1
}

# Drop a link to setup for easy sourcing
ln -s "$MB_ENV_BASE_DIR/setup.sh" ~/.mb_env.setup.sh

# Install homebrew
if needsInstall "brew"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

BREW_LIST="$MB_ENV_BASE_DIR/brew.list"
BREW_LIST_MD5=$(md5 -q "$BREW_LIST")
BREW_LIST_MD5_FILE="$BREW_LIST".md5
CURRENT_BREW_LIST_MD5=$(cat "$BREW_LIST_MD5_FILE" 2>/dev/null)
if [ x"$BREW_LIST_MD5" -ne x"$CURRENT_BREW_LIST_MD5" ]; then
  brew install $(cat "$BREW_LIST")
  echo "$BREW_LIST_MD5" >"$BREW_LIST_MD5_FILE"
fi

# Install SDKman
if needsInstall "sdk"; then
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

SDK_LIST="$MB_ENV_BASE_DIR/sdk.list"
SDK_LIST_MD5=$(md5 -q "$SDK_LIST")
SDK_LIST_MD5_FILE="$SDK_LIST".md5
CURRENT_SDK_LIST_MD5=$(cat "$SDK_LIST_MD5_FILE" 2>/dev/null)
if [ x"$SDK_LIST_MD5" -ne x"$CURRENT_SDK_LIST_MD5" ]; then
  # TODO: Install all the brews
  echo "$SDK_LIST_MD5" >"$SDK_LIST_MD5_FILE"
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

# Install some Go tools
if needsInstall "godoc"; then
  go get golang.org/x/tools/cmd/godoc
fi
if needsInstall "golint"; then
  go get github.com/golang/lint/golint
fi

# TODO: iterate all home-cfg and link to ~/
# TODO: Append bashrc
# TODO: Append bash_profile

echo "Source ~/.bashrc to finish"
