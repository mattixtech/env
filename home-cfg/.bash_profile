# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="~/Library/Python/3.7/bin/:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Changeme
source ~/shared/env/setup.sh
eval "$(starship init bash)"
eval "$(zoxide init bash)"
source ~/.bashrc
set -o vi
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"
