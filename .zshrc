#### ============================ zprezto ====================================
## Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#### ============================= zsh =======================================
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
zstyle :compinstall filename '/home/sebastian/.zshrc'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

#### Aliases 
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias cpi='nocorrect cp -i'
alias mvi='nocorrect mv -i'
alias rmi='nocorrect rm -i'


#### ============================ ssebastianj ================================

#### Aliases -----------------------------------------------------------------
source $HOME/.aliases

#### Colors ------------------------------------------------------------------
autoload -U colors && colors

#### Root dir for development purposes ---------------------------------------
export DEVDIR="$HOME/development"

#### rbenv -------------------------------------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#### tmuxinator --------------------------------------------------------------
export EDITOR="vim"
source $HOME/.bin/tmuxinator.zsh

#### Node Version Manager ----------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Calling nvm use automatically in a directory with a .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
   if [[ -f .nvmrc && -r .nvmrc ]]; then
     nvm use
   elif [[ $(nvm version) != $(nvm version default)  ]]; then
     echo "Reverting to nvm default version"
     nvm use default
   fi
                   }
add-zsh-hook chpwd load-nvmrc
load-nvmrc

#### Added by the Heroku Toolbelt --------------------------------------------
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

#### Python pip user binaries ------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"

#### Virtualenvwrapper -------------------------------------------------------
export WORKON_HOME="$DEVDIR/.virtualenvs"
export PROJECT_HOME=$DEVDIR
export VIRTUALENVWRAPPER_PYTHON=`which python`
# source `which virtualenvwrapper.sh`

#### -------------------------------------------------------------------------
#### Taken from "https://marklodato.github.io/2013/10/25/github-two-factor-and-gnome-keyring.html"
#### Tell D-Bus to use the instance that was started on the machine'so
#### graphical login, and this in turn allows git-credential-gnome-keyring
#### to talk to the main gnome-keyring-daemon instance.
if [[ -z $DBUS_SESSION_BUS_ADDRESS ]]; then
    if [[ -f ~/.dbus/session-bus/$(dbus-uuidgen --get)-0 ]]; then
        source ~/.dbus/session-bus/$(dbus-uuidgen --get)-0
        export DBUS_SESSION_BUS_ADDRESS
    fi
fi

#### Golang ------------------------------------------------------------------
export GOPATH="$DEVDIR/gocode"
export PATH="$PATH:$GOPATH/bin"

#### Git ---------------------------------------------------------------------
export PATH="$HOME/.git-contrib:$PATH"

#### Rust --------------------------------------------------------------------
export RUST_SRC_PATH="$DEVDIR/rust/src"
export CARGO_HOME="$HOME/.cargo"

#### Docker Machine ----------------------------------------------------------
#PS1="$PS1$(__docker_machine_ps1)"

#### Django ------------------------------------------------------------------
bash $HOME/development/django/extras/django_bash_completion

