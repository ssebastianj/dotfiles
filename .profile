# shellcheck shell=bash

# GPG agent
GPG_TTY="$(tty)"
export GPG_TTY

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# cargo
source "$HOME/.cargo/env"
