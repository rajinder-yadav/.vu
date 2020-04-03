#!/usr/bin/env bash

#=============================================================================================
# Setup script for vu.
#
# Author: Rajinder Yadav
# Date: April 2, 2020
# Licence: MIT
# Version: 1.1.1
#=============================================================================================
NODE=$(command -v node)
YARN=$(command -v yarn)
NPM=$(command -v npm)
VUE=$(command -v vue)

# Download vu and update Bash startup script.
git clone git@github.com:rajinder-yadav/.vu.git ${HOME}/.vu
cat >>"${HOME}/.bashrc" <<-EOF

# vu CLI for Vue.js
if [ -f "${HOME}/.vu/vu.sh" ]; then
    . "${HOME}/.vu/vu.sh"
fi
EOF

# Install Vue.js CLI dependency.
if [[ -z ${NODE} ]]; then
    echo "WARNING! You must install Node.js"
else
    if [[ -z ${VUE} ]]; then
        if [[ -z ${YARN} ]]; then
            yarn global add @vue/cli
        elif [[ -z ${NPM} ]]; then
            npm install -g @vue/cli
        fi
    fi
fi

# Place this at the end of the file.
rm vu-setup.sh
