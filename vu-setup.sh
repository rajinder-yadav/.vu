#!/usr/bin/env bash

#=============================================================================================
# Setup script for vu.
#
# Author: Rajinder Yadav
# Date: April 2, 2020
# Licence: MIT
# Version: 1.1.4
#=============================================================================================
NODE=$(command -v node)
NPM=$(command -v npm)
VUE=$(command -v vue)
GIT=$(command -v git)

PLATFORM=$(uname -a)
BASH_PROFILE="${HOME}/.bashrc"

if [[ ${OSTYPE} =~ "darwin" || ${PLATFORM} =~ "Mac" || ${PLATFORM} =~ "Darwin" ]]; then
    BASH_PROFILE="${HOME}/.bash_profile"
fi

if [ -z ${NODE} ]; then
    echo "WARNING! You must install Node.js"
elif [ -z ${VUE} ]; then
    # Install Vue.js CLI dependency.
    npm install -g @vue/cli
fi

if [ -z ${GIT} ]; then
    echo "WARNING! You must install Git."
elif [ -d ${HOME}/.vu ]; then
    # Update vu install.
    pushd ${HOME}/.vu &> /dev/null
    git pull
    popd &> /dev/null
else
    # Download vu and update Bash startup script.
    git clone git@github.com:rajinder-yadav/.vu.git ${HOME}/.vu
    cat >> "${BASH_PROFILE}" <<-EOF

# vu CLI for Vue.js
if [ -f "${HOME}/.vu/vu.sh" ]; then
    . "${HOME}/.vu/vu.sh"
fi
EOF

echo "SUCCESS: vu CLI installed."
echo "Reload bash config with, \"source ${BASH_PROFILE}\", or open a new terminal."
fi

# Place this at the end of the file.
rm vu-setup.sh
