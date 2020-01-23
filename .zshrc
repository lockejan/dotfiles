# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ADD_NEWLINE="false"
#SPACESHIP_CHAR_SYMBOL=" \uf0e7"
#SPACESHIP_CHAR_PREFIX=" \ufb26 "

#DEFAULT_USER=smittie

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
  ansible
 # autopep8
 # colored-man-pages
 # colorize
  django
 # docker
  git
  gpg-agent
 # gradle-completion
  lein
  pipenv
  pyenv
  python
  ripgrep
 # scala
  stack
  sudo
 # terraform
  tmux
  #vi-mode
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'

# aliases#
 alias zshconfig="$EDITOR ~/.zshrc"
 alias i3config="$EDITOR ~/.config/i3/config"
 alias h='history'
 alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
 alias hhu="sudo openvpn --config ~/Documents/HHU-VPN/config.ovpn"
 export OSX="~/.themes/AdMin"
 alias update="sudo dnf upgrade && upgrade_oh_my_zsh && pushd $(pyenv root) && git pull && popd && pushd $OSX && git pull && popd"
 alias reload="source ~/.zshrc"

# path for local binaries
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:"$HOME/.scripts"

# path to JDK
#export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
#export PATH=$PATH:$JAVA_HOME/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# path for jabba
[ -s "/home/smittie/.jabba/jabba.sh" ] && source "/home/smittie/.jabba/jabba.sh"

# add gradle to path
export PATH=$PATH:/opt/gradle/gradle-6.0.1/bin

# add poetry
export PATH=$PATH:"$HOME/.poetry/bin"

# add luarocks bin folder to path
export PATH=$PATH:"$HOME/.luarocks/bin"

# reload gtk settings
function reload_gtk_theme() {
  theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
  gsettings set org.gnome.desktop.interface gtk-theme ''
  sleep 1
  gsettings set org.gnome.desktop.interface gtk-theme $theme
}

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vifm='~/.config/vifm/scripts/vifmrun'
