# pyenv
export PYENV_ROOT="$HOME/.pyenv"
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

export SUDO_ASKPASS=~/bin/askpass-rofi

# GO DIR
# export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"

# deno bin path
export DENO_INSTALL="/home/smittie/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
