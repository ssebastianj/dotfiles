#### ============================ zprezto ====================================
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    # shellcheck source=/dev/null
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#### ============================== zsh  =====================================
#### Add function and completions to search path
fpath=(
    "$HOME/.zsh/functions" 
    "$HOME/.zsh/completions" 
    "${fpath[@]}"
)

## Initialize completion for the current session
autoload -Uz compinit && compinit

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

## Expansion and Globbing
setopt EXTENDED_GLOB

## History
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS

## Input/Output
unsetopt CORRECT_ALL
setopt CORRECT
setopt RM_STAR_WAIT

## Job Control
setopt MONITOR
setopt NOTIFY

## Scripts and Functions
setopt C_BASES

## Zle
# bindkey -v

#### History
export HISTFILE="$HOME/.histfile"
export HISTSIZE=10000
export SAVEHIST=10000

#### Aliases
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias cpi='nocorrect cp -i'
alias mvi='nocorrect mv -i'
alias rmi='nocorrect rm -i'

#### Zstyle
zstyle ':completion:*' cache-path "$HOME/.zsh/cache"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' rehash true
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'

#### ============================ ssebastianj ================================
# shellcheck source=/dev/null
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"
