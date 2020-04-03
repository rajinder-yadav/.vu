#!/usr/bin/env bash

pushd ${HOME}
git clone git@github.com:rajinder-yadav/.vu.git

cat >>"${HOME}/.bashrc" <<-EOF

# vu CLI for Vue.js
if [ -f "${HOME}/.vu/vu.sh" ]; then
    . "${HOME}/.vu/vu.sh"
fi
EOF

rm vu-setup.sh
popd
