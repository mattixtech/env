#@IgnoreInspection BashAddShebang

# The directory this repo exists in
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

export MB_ENV_BASE_DIR="$BASE_DIR"
BIN_DIR="$BASE_DIR/bin"
source "$BASE_DIR"/dirs.sh
source "$BASE_DIR"/alias.sh
source "$BASE_DIR"/commands.sh
source "$BASE_DIR"/copy_configs.sh

# TODO: iterate all envs and source their setup
