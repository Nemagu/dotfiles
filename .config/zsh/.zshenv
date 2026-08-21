if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"

. "$HOME/.cargo/env"

export EDITOR=hx
export VISUAL=hx
