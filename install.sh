#!/usr/bin/env bash

main() {
  local dotfiles_dir="${HOME}/.dotfiles_test"

  tools_check
  dotfiles_check
  dotfiles_download

  cd "${dotfiles_dir}" || return

  make
}

tools_check() {
  local tools=(git make)

  for tool in "${tools[@]}"; do
    if ! [[ "$(command -v ${tool})" ]]; then
      printf "\\033[31mERROR:\\033[0m Tools required: %s.\\n" "${tools[*]}" >&2
      exit 1
    fi
  done
}

dotfiles_check() {
  if [ -d "${dotfiles_dir}" ]; then
    printf "\\033[31mERROR:\\033[0m %s already exists.\\n" "${dotfiles_dir}" >&2
    exit 1
  fi
}

dotfiles_download() {
  git clone https://github.com/nunsez/.dotfiles.git "${dotfiles_dir}"
  printf "\\033[32mSUCCESS:\\033[0m Repository has been cloned to %s.\\n" "${dotfiles_dir}"
}

main
