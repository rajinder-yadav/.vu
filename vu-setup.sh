#!/usr/bin/env bash

#=============================================================================================
# Setup script for vu.
#
# Author: Rajinder Yadav
# Date: April 2, 2020
# Licence: MIT
# Version: 1.0.0
#=============================================================================================

git clone git@github.com:rajinder-yadav/.vu.git ${HOME}/.vu
cat >>"${HOME}/.bashrc" <<-EOF

# vu CLI for Vue.js
if [ -f "${HOME}/.vu/vu.sh" ]; then
    . "${HOME}/.vu/vu.sh"
fi
EOF
rm vu-setup.sh
