# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /etc/zsh/zpreztorc
source /usr/lib/prezto/init.zsh
source /usr/lib/prezto/runcoms/zshrc
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


DEFAULT_USER=schmitt

HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

DISABLE_UPDATE_PROMPT="true"

# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# shortcuts
alias vifm='~/.config/vifm/scripts/vifmrun'
alias i3c="$EDITOR ~/.config/i3/config"
alias sxc="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias chrome="google-chrome-stable"
alias la="exa -la"
alias lh="exa -lh"
alias ll="exa -l"
alias ls="exa"
alias reload="source ~/.zshrc && zinit self-update"
alias sipvpn="sudo -A openvpn --config ~/.config/openvpn/telearbeit"
alias swayc="$EDITOR ~/.config/sway/config"
alias tx=tmuxinator
alias update="yay && zinit self-update && nvim +PlugUpdate +qall"
alias vc="$EDITOR $VIMRC"
alias vf='$EDITOR $(fzf)'
alias zc="$EDITOR ~/.zshrc"

# haskell stack completion for zsh
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    darvid/zsh-poetry

### End of Zinit's installer chunk
zinit load zdharma/history-search-multi-word
zinit load agkozak/zsh-z
