#### ============================ zprezto ====================================
## Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#### ============================ zsh (1) ====================================
#### Completions
fpath=(~/.zsh/completion $fpath)

#### =========================== zsh (2)======================================
#### Advanced tab-completion
# Initialize completion for the current session
autoload -Uz compinit && compinit

#### Prompts
# Initialize advanced prompt support
autoload -Uz promptinit && promptinit

#### Colors
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

## Initilization

## Input/Output
unsetopt CORRECT_ALL
setopt CORRECT
setopt RM_STAR_WAIT

## Job Control
setopt MONITOR
setopt NOTIFY

## Prompting

## Scripts and Functions
setopt C_BASES

## Shell Emulation

## Shell State

## Zle
bindkey -v

#### History
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000

#### Styles
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

#### Aliases
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias cpi='nocorrect cp -i'
alias mvi='nocorrect mv -i'
alias rmi='nocorrect rm -i'
#unalias gpt
#unalias gs

#### ============================ ssebastianj ================================
source ~/.commonrc
