HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
unsetopt beep
bindkey -e

zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit

bindkey '\e[3~' delete-char

hash -d code=/home/alex/Apps/code

typeset -U path

if [[ -d "${HOME}/.local/bin" ]]; then
  path=($path "${HOME}/.local/bin")
fi

reload() {
  source "${HOME}/.zshrc"
}

zedit() {
  vim ~/.zshrc
}

alias ls="ls --color=auto"
alias l="ls -lah"
