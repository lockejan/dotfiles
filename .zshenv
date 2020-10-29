# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export VIMRC="$HOME/.config/nvim/init.vim"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# NPM packages in homedir
# NPM_PACKAGES="$HOME/.npm-packages"

# Tell our environment about user-installed node tools
# PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
# MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Tell Node about these packages
# NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

export SUDO_ASKPASS="$HOME/bin/askpass-rofi"
export JAVA_HOME=/usr/lib/jvm/default

# GO DIR
# export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"

# deno bin path
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# EMACS
export PATH="$PATH:$HOME/.emacs.d/bin"

export SXHKD_SHELL="/bin/bash"
export TERMINAL="/usr/bin/alacritty"
export INDICATOR="/usr/share/sounds/gnome/defaults/alerts/drip.ogg"
export EDITOR="nvim"
export VISUAL="nvim"
export PATH=$PATH:"$HOME/.local/bin":"$HOME/bin"
