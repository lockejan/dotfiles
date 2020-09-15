# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

DEFAULT_USER=schmitt

HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

DISABLE_UPDATE_PROMPT="true"

# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  ansible
  django
  docker
  fzf
  git
  gpg-agent
  lein
  poetry
  pip
  pyenv
  python
  ripgrep
  sudo
  # ssh-agent
  stack
  tmux
  # vi-mode
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias bt=bashtop
alias vim=nvim
alias vi=nvim
alias zc="$EDITOR ~/.zshrc"
alias vc="$EDITOR ~/.config/nvim/init.vim"
alias i3c="$EDITOR ~/.config/i3/config"
alias swayc="$EDITOR ~/.config/sway/config"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias sipvpn="sudo openvpn --config ~/telearbeit"
alias update="yay && omz update" 
alias reload="source ~/.zshrc"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vifm='~/.config/vifm/scripts/vifmrun'
# alias update_nvm="(cd $NVM_DIR && \
#     (git fetch --tags origin \
#     && git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`\
#     && ./nvm.sh) && "

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off


# NPM packages in homedir
# NPM_PACKAGES="$HOME/.npm-packages"

# Tell our environment about user-installed node tools
# PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
# MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Tell Node about these packages
# NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# GO DIR
# export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"

# deno bin path
export DENO_INSTALL="/home/smittie/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# haskell stack bin
alias stack="/home/smittie/.local/bin/stack"

# dotnet
# export PATH="$PATH:~/.dotnet/tools"

sipgateresolvconf () 
{ 
    sudo sed -i 's/^\(nameserver.*$\)/## old nameserver entry: \1/' /etc/resolv.conf;
    echo "nameserver 217.10.64.99" | sudo tee -a /etc/resolv.conf;
    echo "nameserver 217.10.66.66" | sudo tee -a /etc/resolv.conf
}

source ~/io.env

# paleofetch
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
