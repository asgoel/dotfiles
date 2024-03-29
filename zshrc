#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

typeset -gU cdpath fpath mailpath path

# Set up homebrew paths
if [[ -z "$BREW_PREFIX" ]]; then
  export BREW_PREFIX=$([[ "$(arch)" == "arm64" ]] && echo "/opt/homebrew" || echo "/usr/local")
  path=($BREW_PREFIX/bin $BREW_PREFIX/sbin $path)
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Globbing a bit more like bash
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE

# Make delete-by-word stop on punctuation like other editors
WORDCHARS=""

# Naming a directory runs cd for you
setopt AUTO_CD

# Shared history across all shells, updated after every command
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# Break words on forward slash, so delete-word stops on directories
WORDCHARS=${WORDCHARS/\/}

# Show substitutions before running them
setopt HIST_VERIFY

export PAGER="less" # page with less not more
export EDITOR='vim'
export BROWSER="open" # opens URLs in the default OS X browser
export LESS="-XRF" # Fix less to not clear screen on exit, show color, exit if < 1 screen
export CLICOLOR=true # ls with color
export RI="-f ansi" # ri with color
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # use bat for manpages


# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Autoload zsh functions
fpath+=~/.zsh/functions
for func in $(ls ~/.zsh/functions); do
  autoload $func
done

packages=(
  ~/.zsh/aliases.zsh
  ~/.zsh/autocompletions.zsh
  ~/.zsh/fzf.zsh
  "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
)
for file in $packages; do
  [[ -f $file ]] && source $file
done

# Zoxide is like autojump or z
if which zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
  alias j=z
fi

# prefix search history with up and down
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Keep go's installed files out of the way
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source "$BREW_PREFIX/opt/powerlevel10k/powerlevel10k.zsh-theme"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

eval "$(pyenv init -)"

export WHISPER_SYSTEM_ROOT=/Users/ashu/Documents/whisper_system
. `which env_parallel.zsh`

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
