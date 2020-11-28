#@IgnoreInspection BashAddShebang
# Add the bin directory to the PATH
PATH="${ONMS_BIN_DIR}:${PATH}"
export PATH

export OPENNMS_HOME="$OPENNMS_DIR/target/opennms"
export OPENNMS_BIN="$OPENNMS_HOME/bin"
export OPENNMS_LIB="$OPENNMS_HOME/lib"
export OPENNMS_SOURCE="$OPENNMS_DIR"
export DOMINION_SOURCE="$SOURCE_ROOT/dom2/opennms-dominion"
export CLOUD_BACKEND_SOURCE="$SOURCE_ROOT/portal-backend2/portal-backend"
