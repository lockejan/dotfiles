# nvm
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export SUDO_ASKPASS="$HOME/bin/askpass-rofi"
export JAVA_HOME=/usr/lib/jvm/default

# GO DIR
export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"

# deno bin path
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# EMACS
export PATH="$PATH:$HOME/.emacs.d/bin"

export VIMRC="$HOME/.config/nvim/init.vim"
export SXHKD_SHELL="/bin/bash"
export TERMINAL="/usr/bin/alacritty"
export INDICATOR="/usr/share/sounds/gnome/defaults/alerts/drip.ogg"
export EDITOR="nvim"
export VISUAL="nvim"
export PATH=$PATH:"$HOME/.local/bin":"$HOME/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# npm
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
