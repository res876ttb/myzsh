export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(
  zsh-autosuggestions
  shrink-path
  git
  extract
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

alias ls="ls -F --color=auto"
alias la="ls -aF --color=auto"
alias ll="ls -lhF --color=auto"
alias lal="ls -alhF --color=auto"
