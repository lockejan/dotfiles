# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

DEFAULT_USER=schmitt

HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

DISABLE_UPDATE_PROMPT="true"

ENABLE_CORRECTION="false"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# shortcuts
alias vifm='~/.config/vifm/scripts/vifmrun'
alias i3c="$EDITOR ~/.config/i3/config"
alias sxc="$EDITOR ~/.config/sxhkd/sxhkdrc"
alias vc="$EDITOR $VIMRC"
alias zc="$EDITOR ~/.zshrc"
alias vf='$EDITOR $(fzf --height 40%)'

# alias conda="/opt/miniconda3/bin/conda"
alias chrome="google-chrome-stable"

alias la="exa -la"
alias lh="exa -lh"
alias ll="exa -l"
alias ls="exa"

alias reload="source ~/.zshrc && zinit self-update"
alias sipvpn="sudo -A openvpn --config ~/.config/openvpn/telearbeit"
alias tx=tmuxinator
alias yup="yay -Syu --nocleanmenu --nodiffmenu && zinit self-update && nvim +PlugUpdate +qall"

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

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz compinit
compinit
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    matthieusb/zsh-sdkman

### End of Zinit's installer chunk
zinit load zdharma/history-search-multi-word
zinit load agkozak/zsh-z
zinit light Aloxaf/fzf-tab

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# fd - cd to selected directory
fdir() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# for fzf '**' shell completions.
# - The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  command fd --hidden --follow --exclude .git --exclude node_modules . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  command fd --type d --hidden --follow --exclude .git --exclude node_modules . "$1"
}

# Enable fuzzy search key bindings and auto completion
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_COMMAND='fd .'

export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

