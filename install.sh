#!/usr/bin/env bash

main() {
  local dotfiles_dir="${HOME}/.dotfiles"

  tools_check
  dotfiles_check
  dotfiles_download
  source_zshrc
  make_symlinks
}

tools_check() {
  local tools=(git sed)

  for tool in "${tools[@]}"; do
    if ! [[ $(command -v "${tool}") ]]; then
      error "Tools required: ${tools[*]}."
      exit 1
    fi
  done
}

dotfiles_check() {
  if [ -d "${dotfiles_dir}" ]; then
    error "${dotfiles_dir} already exists."
    exit 1
  fi
}

dotfiles_download() {
  git clone --recurse-submodules git@github.com:nunsez/.dotfiles.git "${dotfiles_dir}"
  success "Repository has been cloned to ${dotfiles_dir}"
}

source_zshrc() {
  local home_zshrc="${HOME}/.zshrc"

  if [[ ! -f "${home_zshrc}" ]]; then
    echo "\n" > "${home_zshrc}"
  fi

  sed -i "1isource ${dotfiles_dir}/.zsh/.zshrc" "${home_zshrc}"
}

make_symlinks() {
  "${dotfiles_dir}/dotfiles" link
}

success() {
  printf "\\033[32mSUCCESS:\\033[0m %s\\n" "$@"
}

error() {
  printf "\\033[31mERROR:\\033[0m %s\\n" "$@" >&2
}

main
