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

zstyle ':bracketed-paste-magic' active-widgets '.self-*'

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
  # zsh-abbr
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias vifm='~/.config/vifm/scripts/vifmrun'
alias vim=nvim
alias vi=nvim
alias bt=bashtop
alias i3c="$EDITOR ~/.config/i3/config"
alias la="exa -la"
alias lh="exa -lh"
alias ll="exa -l"
alias ls="exa"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias reload="source ~/.zshrc"
alias sipvpn="sudo openvpn --config ~/telearbeit"
alias swayc="$EDITOR ~/.config/sway/config"
alias update="yay && omz update && nvim +PlugUpdate +qall"
alias vc="$EDITOR $VIMRC"
alias vf='$EDITOR $(fzf)'
alias zc="$EDITOR ~/.zshrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

sipgateresolvconf ()
{
    sudo sed -i 's/^\(nameserver.*$\)/## old nameserver entry: \1/' /etc/resolv.conf;
    echo "nameserver 217.10.64.99" | sudo tee -a /etc/resolv.conf;
    echo "nameserver 217.10.66.66" | sudo tee -a /etc/resolv.conf
}

source ~/.io.env
git-team disable > /dev/null
