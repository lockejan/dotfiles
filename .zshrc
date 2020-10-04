# invoke ssh-add if key not present
ssh-add -l | grep -q `ssh-keygen -lf ~/.ssh/id_rsa  | awk '{print $2}'` ||  ssh-add ~/.ssh/id_rsa

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

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
  stack
  tmux
  z
  zsh-autosuggestions
  zsh-abbr
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias vifm='~/.config/vifm/scripts/vifmrun'
alias vim=nvim
alias vi=nvim

sipgateresolvconf ()
{
    sudo sed -i 's/^\(nameserver.*$\)/## old nameserver entry: \1/' /etc/resolv.conf;
    echo "nameserver 217.10.64.99" | sudo tee -a /etc/resolv.conf;
    echo "nameserver 217.10.66.66" | sudo tee -a /etc/resolv.conf
}

source ~/io.env
git-team disable > /dev/null
