export ZSH=$HOME/.oh-my-zsh
if [[ "$BACKGROUND" == "black" ]]; then
  ZSH_THEME="ys"
else
  ZSH_THEME="myys"
fi
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
