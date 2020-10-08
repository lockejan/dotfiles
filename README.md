# dotfiles

Just my dotfile setup for different machines (look at the branches).

It's pretty straight forward. No additional config is needed.
My Home dir is a git repo, but I ignore everything per default.

`git init` in your home dir and put `*` in your `.gitignore`.

Everything then has to be added forcefully.
For e.g. `git add -f .zshrc`

Note: because [ripgrep takes ignore files into account](https://github.com/BurntSushi/ripgrep/issues/645) I make use of additional ignore files to keep it functional.

Inspired by Drew DeVaults [dotfile setup](https://drewdevault.com/2019/12/30/dotfiles.html)
