#@IgnoreInspection BashAddShebang

# Add the bin directory to the PATH
[ ! -f "$BIN_DIR" ] && mkdir "$BIN_DIR"
PATH="${BIN_DIR}:${PATH}"
export PATH
export SOURCE_ROOT="$BASE_DIR/.."
