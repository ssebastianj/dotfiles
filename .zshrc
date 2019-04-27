# shellcheck shell=bash

#### ============================ zprezto ====================================
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    # shellcheck source=/dev/null
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#### ============================== zsh  =====================================
#### Add functions and completions to search path
fpath=(
    "${HOME}/.zsh/functions"
    "${HOME}/.zsh/completions"
    "${fpath[@]}"
)

## Initialize completion for the current session
autoload -Uz compinit

# Only check cache once a day
# Source: https://gist.github.com/ctechols/ca1035271ad134841284
setopt EXTENDEDGLOB
for zcompdumpFile in "${HOME}/.zcompdump"(#qN.mh+24); do
    compinit

    if [[ -s "${zcompdumpFile}" && (! -s "${zcompdumpFile}.zwc" || "${zcompdumpFile}" -nt "${zcompdumpFile}.zwc") ]]; then
      zcompile "${zcompdumpFile}"
    fi
done
unsetopt EXTENDEDGLOB
compinit -C

## Initialize advanced prompt support
autoload -Uz promptinit && promptinit

## Initialize colors support
autoload -Uz colors && colors

#### Options
## Changing Directories
setopt PUSHD_IGNORE_DUPS

## Completion
unsetopt AUTO_NAME_DIRS
setopt AUTO_LIST
setopt AUTO_MENU
setopt REC_EXACT

## History
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS

## Input/Output
unsetopt CORRECT_ALL
unsetopt CORRECT
setopt RM_STAR_WAIT

## Job Control
setopt MONITOR
setopt NOTIFY

## Scripts and Functions
setopt C_BASES

## Zle
# bindkey -v

#### History
export HISTFILE="${HOME}/.history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

#### Zstyle
zstyle ':completion:*' cache-path "${HOME}/.zsh/cache"
zstyle ':completion:*' use-cache on
#zstyle ':completion:*' rehash true
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'

# shellcheck source=/dev/null
[[ -s "${HOME}/.commonrc" ]] && source "${HOME}/.commonrc"
