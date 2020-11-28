#@IgnoreInspection BashAddShebang
# Convenient alias commands for interactive shells
alias onms-assemble="$OPENNMS_SOURCE/assemble.pl -DskipTests=true"
alias onms-builddeploy="clean && compile && deployModule"
alias onms-clean="$OPENNMS_SOURCE/clean.pl -DskipTests=true"
alias onms-compileParallel="$OPENNMS_SOURCE/compile.pl -DskipTests=true -DvaadinJavaMaxMemory=1g -DmaxCpus=7 install --builder smart --threads 7"
alias onms-compile="$OPENNMS_SOURCE/compile.pl -DskipTests=true"
alias onms-test-module="nstop; $OPENNMS_SOURCE/compile.pl -t"
alias nstart="sudo $OPENNMS_HOME/bin/opennms -vt start"
alias nstop='sudo kill -9 $(pgrep -f opennms_bootstrap.jar)'
alias oh="cd \"$OPENNMS_HOME\"; pwd"
alias proj-opennms="cd \"$OPENNMS_SOURCE\"; pwd"
alias proj-dominion="cd \"$DOMINION_SOURCE\"; pwd"
alias proj-backend="cd \"$CLOUD_BACKEND_SOURCE\"; pwd"
