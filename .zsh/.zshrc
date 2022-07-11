HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=1000

bindkey -e
bindkey '\e[3~' delete-char

setopt appendhistory
setopt bg_nice # lower priority to bg processes
setopt correct # check all the commands you type and if they don't exist, but there is one with a similar name, it will ask you if you meant that one instead
setopt inc_append_history  # save history after every command
setopt hist_ignore_dups # not to store a history line if it's the same as the previous one
setopt hist_find_no_dups # if duplicate lines have been saved, searches backwards with editor commands don't show them more than once
setopt hist_expire_dups_first # preferentially removes duplicates when the history fills up, but does nothing until then
setopt hist_reduce_blanks # remove blanks before save to hostory
setopt hist_no_store # not to store history or fc commands
setopt nomatch # print error if no matches
setopt notify # notify when bg process is done
setopt prompt_subst # allows substitution in PS1 / PS2..
setopt share_history # share history between shells

unsetopt autocd
unsetopt beep
unsetopt extendedglob
unsetopt hist_beep # remove beep if you try to scroll up or down beyond the end of the history list

zstyle :compinstall filename "${HOME}/.zshrc"

export GPG_TTY=$(tty)
export DOTFILES_DIR="${HOME}/.dotfiles"
export ZSH_CUSTOM="${DOTFILES_DIR}/.zsh"

fpath=("${ZSH_CUSTOM}/functions" $fpath)

autoload -Uz reload zedit
autoload -Uz colors && colors
autoload -Uz compinit && compinit

# hash -d code=/home/alex/Apps/code

source "${ZSH_CUSTOM}/aliases"
source "${ZSH_CUSTOM}/plugins/init"

if [[ -d "${HOME}/.local/bin" ]]; then
  path=($path "${HOME}/.local/bin")
fi

if [ -d "${HOME}/.asdf" ]; then
  export ASDF_DIR="${HOME}/.asdf/"
  source "${ASDF_DIR}/asdf.sh"
fi
