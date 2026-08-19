if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR=nvim
export VISUAL=nvim
. "$HOME/.cargo/env"
