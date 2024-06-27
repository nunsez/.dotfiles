#!/usr/bin/env bash

set -eu
set -o pipefail

cd -P -- "$(dirname -- "$0")"

USER_DIR="${PWD}/user"

function stow_user() {
    local package=$1
    stow --restow --verbose --target "${HOME}" --dir "${USER_DIR}" "${package}"
}

stow_user "zsh"
stow_user "git"
stow_user "helix"
