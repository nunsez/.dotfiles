#!/usr/bin/env bash

set -eu
set -o pipefail

cd -P -- "$(dirname -- "$0")"

USER_DIR="${PWD}/user"

function link_user() {
    local package=$1
    linker relink --dir "${USER_DIR}" --target "${HOME}" "${package}"
}

link_user "fish"
link_user "git"
link_user "helix"
link_user "lazygit"
link_user "vscode"
link_user "mise"
