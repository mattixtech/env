#@IgnoreInspection BashAddShebang
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

BREW_LIST="$BASE_DIR/brew.list"
BREW_LIST_MD5=$(md5 -q "$BREW_LIST")
BREW_LIST_MD5_FILE="$BREW_LIST".md5
CURRENT_BREW_LIST_MD5=$(cat "$BREW_LIST_MD5_FILE" 2>/dev/null)
if [ x"$BREW_LIST_MD5" -ne x"$CURRENT_BREW_LIST_MD5" ]; then
  # TODO: Install all the brews
  echo "$BREW_LIST_MD5" >"$BREW_LIST_MD5_FILE"
fi

# Install SDKman
if needsInstall "sdk"; then
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

SDK_LIST="$BASE_DIR/sdk.list"
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
