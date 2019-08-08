export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="myys"
plugins=(
  zsh-autosuggestions
  shrink-path
  git
  extract
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

unsetopt share_history

if [[ "$OSTYPE" == "darwin"* ]]; then
  # do nothing
else
  alias ls="ls -F --color=auto"
  alias la="ls -aF --color=auto"
  alias ll="ls -lhF --color=auto"
  alias lal="ls -alhF --color=auto"
fi

export PATH=$HOME/.bin:$PATH

source $HOME/.zsh_profile
