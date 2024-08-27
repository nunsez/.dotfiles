#!/usr/bin/env bash

set -eu
set -o pipefail

cd -P -- "$(dirname -- "$0")"

USER_DIR="${PWD}/user"

function is_not_link() {
    local path=$1
    if [ -f "${path}" ] && [ ! -L "${path}" ]; then
        return 0
    else
        return 1
    fi
}

function remove_if_not_link() {
    local path=$1
    if is_not_link "${path}"; then
        rm "${path}"
    fi
}

function stow_user() {
    local package=$1
    stow --restow --verbose --target "${HOME}" --dir "${USER_DIR}" "${package}"
}

stow_user "zsh"
stow_user "git"
stow_user "helix"
stow_user "lazygit"

remove_if_not_link "${HOME}/.config/broot/conf.hjson"
remove_if_not_link "${HOME}/.config/broot/verbs.hjson"
stow_user "broot"

stow_user "vscode"
