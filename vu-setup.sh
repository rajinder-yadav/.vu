#!/usr/bin/env bash

git clone git@github.com:rajinder-yadav/.vu.git ${HOME}/.vu
cat >>"${HOME}/.bashrc" <<-EOF

# vu CLI for Vue.js
if [ -f "${HOME}/.vu/vu.sh" ]; then
    . "${HOME}/.vu/vu.sh"
fi
EOF
rm vu-setup.sh
