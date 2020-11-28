#@IgnoreInspection BashAddShebang
export OPENNMS_SETUP_DEFINED="true"

# ***CHANGEME*** ***CHANGEME***
# These need to point to the correct directory on your system
# The directory the opennms git repo exists in
OPENNMS_DIR="/Users/opennms/shared/opennms"
# ***CHANGEME*** ***CHANGEME***

ONMS_BASE_DIR="$BASE_DIR/onms"
ONMS_BIN_DIR="$ONMS_BASE_DIR/bin"
export OPENNMS_SETUP_DEFINED="true"
source "$ONMS_BASE_DIR"/dirs.sh
source "$ONMS_BASE_DIR"/alias.sh
source "$ONMS_BASE_DIR"/commands.sh
source "$ONMS_BASE_DIR"/routines.sh
