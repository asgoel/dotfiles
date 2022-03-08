#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

export PATH="$HOME/.poetry/bin:$PATH"
export WHISPER_SYSTEM_ROOT=/Users/ashu/Documents/whisper_system

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &>/dev/null; then eval "$(pyenv init -)"; fi
eval "$(direnv hook zsh)"
if command -v pyenv &>/dev/null; then eval "$(pyenv init --path)"; fi
