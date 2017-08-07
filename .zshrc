#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

function move_to() {
    cd ~/Documents/$1
}

alias v="vim"
alias g="git"
alias m=move_to
export PATH="/home/ashu/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

# Customize to your needs...
