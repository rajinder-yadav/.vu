#!/usr/bin/env bash

#=============================================================================================
# Setup script for vu.
#
# Author: Rajinder Yadav
# Date: April 2, 2020
# Licence: MIT
# Version: 1.2.0
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

# Check dependencies.
if [ -z ${NODE} ]; then
    echo "=> WARNING! You must install Node.js"
    exit 100
elif [ -z ${GIT} ]; then
    echo "=> WARNING! You must install Git."
    exit 101
elif [ -z ${VUE} ]; then
    # Install Vue.js CLI dependency.
    npm install -g @vue/cli
    if [ $? -eq 0 ]; then
        echo "=> SUCCESS: Vue.js installed"
    else
        echo "=> ERROR: Vue.js NPM package installation failed."
        exit 102
    fi
fi

if [ -d ${HOME}/.vu ]; then
    # Update vu install.
    pushd ${HOME}/.vu &> /dev/null
    git pull
    if [ $? -eq 0 ]; then
        echo "=> SUCCESS: vu CLI updated."
    else
        echo "=> ERROR: vu CLI update failed."
        exit 103
    fi
    popd &> /dev/null
else
    # Download vu and update Bash init script.
    git clone git@github.com:rajinder-yadav/vu.git ${HOME}/.vu
    if [ $? -eq 0 ]; then
        echo "=> SUCCESS: vu project downloaded."
    else
        echo "=> ERROR: vu project download failed."
        exit 104
    fi

    # Only update Bash init if snippet does not exist.
    grep -P "{HOME}/.vu/vu.sh" ~/.bashrc &>/dev/null
    if [ $? -ne 0 ]; then
    cat >> "${BASH_PROFILE}" <<-EOF

# Enable vu CLI script for Vue.js
if [ -f "${HOME}/.vu/vu.sh" ]; then
    . "${HOME}/.vu/vu.sh"
fi
EOF
    fi

    if [ $? -eq 0 ]; then
        echo "=> SUCCESS: Bash init script updated."
    else
        echo "=> ERROR: Bash init script update failed."
        exit 105
    fi

    echo "SUCCESS: vu CLI installed."
    echo "Reload bash config with, \"source ${BASH_PROFILE}\", or open a new terminal."
fi

# Place this at the end of the file.
rm vu-setup.sh
