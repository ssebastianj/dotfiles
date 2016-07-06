## Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Disable autocorrect guesses.
unsetopt CORRECT

# 10 seconds wait if something will delete everything.
setopt RM_STAR_WAIT

# Enable extended glob
setopt EXTENDED_GLOB

# Expand/complete with dots
expand-or-complete-with-dots() {
    echo -n "\e[31m......\e[0m"
    zle expand-or-complete
    zle redisplay
}

zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
# 

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sebastian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


#### ---------------------------- ssebastianj --------------------------------
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

